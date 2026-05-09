; DESCRIPTION: Places a blue line segment connecting (217, 25) to (19, 200).
; PLAN: r0=217(x1), r1=25(y1), r2=19(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 25
LDI r2, 19
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
