; DESCRIPTION: Places a yellow line segment connecting (188, 243) to (331, 10).
; PLAN: r0=188(x1), r1=243(y1), r2=331(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 243
LDI r2, 331
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
