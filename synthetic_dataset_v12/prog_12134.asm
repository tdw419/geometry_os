; DESCRIPTION: Composite: Places a blue line segment connecting (371, 40) to (251, 0) then Places a green dot at position (170, 4).
; PLAN: r0=371(x1), r1=40(y1), r2=251(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=4(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 371
LDI r1, 40
LDI r2, 251
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 4
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
