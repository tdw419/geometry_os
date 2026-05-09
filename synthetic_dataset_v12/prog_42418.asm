; DESCRIPTION: Places a white line segment connecting (237, 219) to (46, 249).
; PLAN: r0=237(x1), r1=219(y1), r2=46(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 219
LDI r2, 46
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
