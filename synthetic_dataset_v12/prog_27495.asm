; DESCRIPTION: Renders a yellow line between points (15, 84) and (23, 52).
; PLAN: r0=15(x1), r1=84(y1), r2=23(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 84
LDI r2, 23
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
