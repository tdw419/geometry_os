; DESCRIPTION: Places a white line segment connecting (237, 255) to (133, 238).
; PLAN: r0=237(x1), r1=255(y1), r2=133(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 255
LDI r2, 133
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
