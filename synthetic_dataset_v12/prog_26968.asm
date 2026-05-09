; DESCRIPTION: Composite: Draws a yellow circle centered at (293, 87) with radius 47 then Draws a red rectangle at (322, 22) with width 42 and height 86.
; PLAN: r0=293(x), r1=87(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x), r6=22(y), r7=42(width), r8=86(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 293
LDI r1, 87
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 22
LDI r7, 42
LDI r8, 86
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
