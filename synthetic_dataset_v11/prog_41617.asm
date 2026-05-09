; DESCRIPTION: Renders a green line between points (108, 88) and (105, 220).
; PLAN: r0=108(x1), r1=88(y1), r2=105(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 88
LDI r2, 105
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
