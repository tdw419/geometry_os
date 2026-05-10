; DESCRIPTION: Renders a magenta line between points (100, 108) and (33, 176).
; PLAN: r0=100(x1), r1=108(y1), r2=33(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 108
LDI r2, 33
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
