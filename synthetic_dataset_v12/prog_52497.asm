; DESCRIPTION: Draws a orange line from (220, 144) to (463, 6).
; PLAN: r0=220(x1), r1=144(y1), r2=463(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 144
LDI r2, 463
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
