; DESCRIPTION: Places a black line segment connecting (18, 160) to (215, 205).
; PLAN: r0=18(x1), r1=160(y1), r2=215(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 160
LDI r2, 215
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
