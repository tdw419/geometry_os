; DESCRIPTION: Renders a yellow line between points (13, 222) and (6, 61).
; PLAN: r0=13(x1), r1=222(y1), r2=6(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 222
LDI r2, 6
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
