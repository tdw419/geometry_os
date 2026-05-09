; DESCRIPTION: Renders a magenta line between points (213, 106) and (382, 69).
; PLAN: r0=213(x1), r1=106(y1), r2=382(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 106
LDI r2, 382
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
