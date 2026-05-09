; DESCRIPTION: Renders a magenta line between points (493, 97) and (444, 176).
; PLAN: r0=493(x1), r1=97(y1), r2=444(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 97
LDI r2, 444
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
