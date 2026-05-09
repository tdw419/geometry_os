; DESCRIPTION: Renders a orange line between points (127, 64) and (79, 127).
; PLAN: r0=127(x1), r1=64(y1), r2=79(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 64
LDI r2, 79
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
