; DESCRIPTION: Draws a green line from (149, 12) to (56, 88).
; PLAN: r0=149(x1), r1=12(y1), r2=56(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 12
LDI r2, 56
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
