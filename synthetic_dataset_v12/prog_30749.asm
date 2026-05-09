; DESCRIPTION: Renders a magenta line between points (385, 0) and (65, 167).
; PLAN: r0=385(x1), r1=0(y1), r2=65(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 0
LDI r2, 65
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
