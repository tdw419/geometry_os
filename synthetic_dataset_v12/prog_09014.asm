; DESCRIPTION: Renders a orange line between points (463, 15) and (493, 146).
; PLAN: r0=463(x1), r1=15(y1), r2=493(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 15
LDI r2, 493
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
