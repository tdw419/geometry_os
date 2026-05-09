; DESCRIPTION: Places a black line segment connecting (389, 226) to (492, 38).
; PLAN: r0=389(x1), r1=226(y1), r2=492(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 226
LDI r2, 492
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
