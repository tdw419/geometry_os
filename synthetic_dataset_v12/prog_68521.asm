; DESCRIPTION: Composite: Places a orange line segment connecting (23, 30) to (246, 144) then Places a orange circle of radius 48 at center (243, 106) then Sets a single magenta pixel at (162, 159).
; PLAN: r0=23(x1), r1=30(y1), r2=246(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=106(y), r7=48(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=162(x), r11=159(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 23
LDI r1, 30
LDI r2, 246
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 106
LDI r7, 48
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 162
LDI r11, 159
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
