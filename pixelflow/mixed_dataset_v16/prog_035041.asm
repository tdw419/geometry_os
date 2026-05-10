; DESCRIPTION: Renders a magenta line between points (19, 249) and (477, 43).
; PLAN: r0=19(x1), r1=249(y1), r2=477(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 249
LDI r2, 477
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
