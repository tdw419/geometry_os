; DESCRIPTION: Places a magenta line segment connecting (298, 110) to (390, 86).
; PLAN: r0=298(x1), r1=110(y1), r2=390(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 110
LDI r2, 390
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
