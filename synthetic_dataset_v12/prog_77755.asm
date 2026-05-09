; DESCRIPTION: Places a white line segment connecting (324, 192) to (491, 243).
; PLAN: r0=324(x1), r1=192(y1), r2=491(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 192
LDI r2, 491
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
