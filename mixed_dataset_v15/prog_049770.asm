; DESCRIPTION: Draws a orange line from (450, 66) to (52, 240).
; PLAN: r0=450(x1), r1=66(y1), r2=52(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 66
LDI r2, 52
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
