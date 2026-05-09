; DESCRIPTION: Renders a magenta line between points (182, 184) and (25, 43).
; PLAN: r0=182(x1), r1=184(y1), r2=25(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 184
LDI r2, 25
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
