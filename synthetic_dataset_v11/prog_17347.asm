; DESCRIPTION: Places a black line segment connecting (237, 73) to (33, 64).
; PLAN: r0=237(x1), r1=73(y1), r2=33(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 73
LDI r2, 33
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
