; DESCRIPTION: Places a black line segment connecting (4, 213) to (423, 141).
; PLAN: r0=4(x1), r1=213(y1), r2=423(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 213
LDI r2, 423
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
