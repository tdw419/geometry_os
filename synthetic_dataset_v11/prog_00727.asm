; DESCRIPTION: Places a black line segment connecting (236, 167) to (204, 220).
; PLAN: r0=236(x1), r1=167(y1), r2=204(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 167
LDI r2, 204
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
