; DESCRIPTION: Composite: Places a purple line segment connecting (303, 251) to (501, 74) then Places a black circle of radius 79 at center (367, 89).
; PLAN: r0=303(x1), r1=251(y1), r2=501(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=89(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 303
LDI r1, 251
LDI r2, 501
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 89
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
