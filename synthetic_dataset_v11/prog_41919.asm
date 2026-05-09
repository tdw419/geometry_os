; DESCRIPTION: Renders a magenta line between points (24, 5) and (101, 127).
; PLAN: r0=24(x1), r1=5(y1), r2=101(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 5
LDI r2, 101
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
