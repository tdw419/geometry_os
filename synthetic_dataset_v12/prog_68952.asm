; DESCRIPTION: Draws a yellow line from (78, 254) to (62, 5).
; PLAN: r0=78(x1), r1=254(y1), r2=62(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 254
LDI r2, 62
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
