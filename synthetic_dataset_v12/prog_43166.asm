; DESCRIPTION: Renders a magenta line between points (446, 49) and (490, 143).
; PLAN: r0=446(x1), r1=49(y1), r2=490(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 49
LDI r2, 490
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
