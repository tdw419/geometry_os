; DESCRIPTION: Renders a blue line between points (63, 102) and (73, 83).
; PLAN: r0=63(x1), r1=102(y1), r2=73(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 102
LDI r2, 73
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
