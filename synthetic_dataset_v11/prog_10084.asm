; DESCRIPTION: Renders a magenta line between points (121, 155) and (162, 228).
; PLAN: r0=121(x1), r1=155(y1), r2=162(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 155
LDI r2, 162
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
