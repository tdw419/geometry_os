; DESCRIPTION: Places a yellow line segment connecting (123, 213) to (78, 13).
; PLAN: r0=123(x1), r1=213(y1), r2=78(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 213
LDI r2, 78
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
