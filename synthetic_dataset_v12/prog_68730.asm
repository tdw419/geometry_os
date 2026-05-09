; DESCRIPTION: Renders a orange line between points (115, 97) and (64, 75).
; PLAN: r0=115(x1), r1=97(y1), r2=64(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 97
LDI r2, 64
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
