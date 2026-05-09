; DESCRIPTION: Renders a magenta line between points (96, 160) and (121, 230).
; PLAN: r0=96(x1), r1=160(y1), r2=121(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 160
LDI r2, 121
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
