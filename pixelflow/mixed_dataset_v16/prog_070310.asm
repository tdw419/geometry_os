; DESCRIPTION: Composite: Places a yellow dot at position (214, 62) then Creates a magenta rectangular region at (81, 202) spanning 54 by 28 pixels.
; PLAN: r0=214(x), r1=62(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=202(y), r7=54(width), r8=28(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 62
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 81
LDI r6, 202
LDI r7, 54
LDI r8, 28
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
