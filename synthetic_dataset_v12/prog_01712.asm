; DESCRIPTION: Composite: Draws a yellow rectangle at (5, 188) with width 87 and height 27 then Sets a single red pixel at (26, 109).
; PLAN: r0=5(x), r1=188(y), r2=87(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=26(x), r6=109(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 5
LDI r1, 188
LDI r2, 87
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 109
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
