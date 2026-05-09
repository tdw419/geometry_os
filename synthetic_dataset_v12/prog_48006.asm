; DESCRIPTION: Places a black line segment connecting (237, 215) to (356, 24).
; PLAN: r0=237(x1), r1=215(y1), r2=356(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 215
LDI r2, 356
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
