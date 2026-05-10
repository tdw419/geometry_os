; DESCRIPTION: Renders a magenta line between points (349, 172) and (181, 12).
; PLAN: r0=349(x1), r1=172(y1), r2=181(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 172
LDI r2, 181
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
