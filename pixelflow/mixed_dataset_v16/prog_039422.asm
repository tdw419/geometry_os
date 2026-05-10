; DESCRIPTION: Renders a magenta line between points (62, 150) and (340, 158).
; PLAN: r0=62(x1), r1=150(y1), r2=340(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 150
LDI r2, 340
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
