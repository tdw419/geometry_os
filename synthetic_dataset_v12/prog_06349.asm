; DESCRIPTION: Places a white line segment connecting (97, 226) to (237, 168).
; PLAN: r0=97(x1), r1=226(y1), r2=237(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 226
LDI r2, 237
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
