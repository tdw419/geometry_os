; DESCRIPTION: Renders a magenta line between points (12, 43) and (62, 107).
; PLAN: r0=12(x1), r1=43(y1), r2=62(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 43
LDI r2, 62
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
