; DESCRIPTION: Composite: Places a white line segment connecting (288, 164) to (390, 203) then Sets a single green pixel at (184, 74).
; PLAN: r0=288(x1), r1=164(y1), r2=390(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=74(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 288
LDI r1, 164
LDI r2, 390
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 74
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
