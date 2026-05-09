; DESCRIPTION: Renders a magenta line between points (426, 30) and (192, 168).
; PLAN: r0=426(x1), r1=30(y1), r2=192(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 30
LDI r2, 192
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
