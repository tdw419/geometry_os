; DESCRIPTION: Places a green line segment connecting (454, 108) to (129, 243).
; PLAN: r0=454(x1), r1=108(y1), r2=129(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 108
LDI r2, 129
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
