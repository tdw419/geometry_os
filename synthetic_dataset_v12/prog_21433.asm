; DESCRIPTION: Places a black line segment connecting (213, 200) to (423, 178).
; PLAN: r0=213(x1), r1=200(y1), r2=423(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 200
LDI r2, 423
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
