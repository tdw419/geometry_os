; DESCRIPTION: Renders a magenta line between points (406, 113) and (121, 157).
; PLAN: r0=406(x1), r1=113(y1), r2=121(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 113
LDI r2, 121
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
