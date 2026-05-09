; DESCRIPTION: Renders a yellow line between points (0, 95) and (79, 127).
; PLAN: r0=0(x1), r1=95(y1), r2=79(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 95
LDI r2, 79
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
