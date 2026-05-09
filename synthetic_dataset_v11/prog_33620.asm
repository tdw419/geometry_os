; DESCRIPTION: Renders a magenta line between points (79, 113) and (151, 9).
; PLAN: r0=79(x1), r1=113(y1), r2=151(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 113
LDI r2, 151
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
