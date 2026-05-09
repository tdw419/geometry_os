; DESCRIPTION: Renders a magenta line between points (121, 158) and (365, 1).
; PLAN: r0=121(x1), r1=158(y1), r2=365(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 158
LDI r2, 365
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
