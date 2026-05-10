; DESCRIPTION: Places a yellow line segment connecting (326, 215) to (112, 250).
; PLAN: r0=326(x1), r1=215(y1), r2=112(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 215
LDI r2, 112
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
