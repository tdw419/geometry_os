; DESCRIPTION: Renders a magenta line between points (303, 246) and (119, 46).
; PLAN: r0=303(x1), r1=246(y1), r2=119(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 246
LDI r2, 119
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
