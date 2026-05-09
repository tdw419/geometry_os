; DESCRIPTION: Renders a red line between points (203, 97) and (63, 216).
; PLAN: r0=203(x1), r1=97(y1), r2=63(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 97
LDI r2, 63
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
