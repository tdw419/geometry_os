; DESCRIPTION: Places a black line segment connecting (122, 144) to (164, 184).
; PLAN: r0=122(x1), r1=144(y1), r2=164(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 144
LDI r2, 164
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
