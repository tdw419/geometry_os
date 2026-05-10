; DESCRIPTION: Renders a orange line between points (434, 187) and (399, 58).
; PLAN: r0=434(x1), r1=187(y1), r2=399(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 187
LDI r2, 399
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
