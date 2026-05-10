; DESCRIPTION: Renders a blue line between points (63, 101) and (182, 25).
; PLAN: r0=63(x1), r1=101(y1), r2=182(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 101
LDI r2, 182
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
