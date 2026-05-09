; DESCRIPTION: Places a purple line segment connecting (331, 103) to (298, 78).
; PLAN: r0=331(x1), r1=103(y1), r2=298(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 103
LDI r2, 298
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
