; DESCRIPTION: Places a black line segment connecting (442, 197) to (73, 184).
; PLAN: r0=442(x1), r1=197(y1), r2=73(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 197
LDI r2, 73
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
