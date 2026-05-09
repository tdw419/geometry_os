; DESCRIPTION: Composite: Places a magenta 87x95 rectangle at position (85, 161) then Sets a single orange pixel at (306, 54) then Renders a yellow disk with center (330, 157) and radius 77.
; PLAN: r0=85(x), r1=161(y), r2=87(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=54(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=330(x), r11=157(y), r12=77(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 85
LDI r1, 161
LDI r2, 87
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 54
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 330
LDI r11, 157
LDI r12, 77
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
