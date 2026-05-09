; DESCRIPTION: Renders a orange line between points (101, 146) and (127, 6).
; PLAN: r0=101(x1), r1=146(y1), r2=127(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 146
LDI r2, 127
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
