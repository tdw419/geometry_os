; DESCRIPTION: Places a green line segment connecting (491, 56) to (18, 243).
; PLAN: r0=491(x1), r1=56(y1), r2=18(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 56
LDI r2, 18
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
