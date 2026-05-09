; DESCRIPTION: Composite: Places a yellow dot at position (429, 196) then Creates a red rectangular region at (125, 28) spanning 99 by 79 pixels.
; PLAN: r0=429(x), r1=196(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=125(x), r6=28(y), r7=99(width), r8=79(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 429
LDI r1, 196
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 125
LDI r6, 28
LDI r7, 99
LDI r8, 79
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
