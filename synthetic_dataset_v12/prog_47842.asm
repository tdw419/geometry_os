; DESCRIPTION: Places a black line segment connecting (164, 229) to (287, 204).
; PLAN: r0=164(x1), r1=229(y1), r2=287(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 229
LDI r2, 287
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
