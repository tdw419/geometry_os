; DESCRIPTION: Composite: Renders a orange line between points (298, 85) and (11, 106) then Places a purple circle of radius 32 at center (240, 80).
; PLAN: r0=298(x1), r1=85(y1), r2=11(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=80(y), r7=32(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 298
LDI r1, 85
LDI r2, 11
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 80
LDI r7, 32
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
