; DESCRIPTION: Renders a magenta line between points (472, 185) and (337, 70).
; PLAN: r0=472(x1), r1=185(y1), r2=337(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 185
LDI r2, 337
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
