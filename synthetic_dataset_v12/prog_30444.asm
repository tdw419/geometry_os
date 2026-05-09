; DESCRIPTION: Places a white line segment connecting (237, 80) to (327, 142).
; PLAN: r0=237(x1), r1=80(y1), r2=327(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 80
LDI r2, 327
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
