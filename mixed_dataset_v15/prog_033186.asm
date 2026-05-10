; DESCRIPTION: Places a black line segment connecting (324, 211) to (215, 152).
; PLAN: r0=324(x1), r1=211(y1), r2=215(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 211
LDI r2, 215
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
