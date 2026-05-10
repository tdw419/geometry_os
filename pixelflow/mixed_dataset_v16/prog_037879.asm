; DESCRIPTION: Composite: Places a purple line segment connecting (247, 85) to (251, 62) then Places a orange dot at position (100, 233) then Renders a purple disk with center (103, 64) and radius 24.
; PLAN: r0=247(x1), r1=85(y1), r2=251(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=233(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=103(x), r11=64(y), r12=24(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 247
LDI r1, 85
LDI r2, 251
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 233
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 103
LDI r11, 64
LDI r12, 24
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
