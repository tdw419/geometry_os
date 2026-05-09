; DESCRIPTION: Renders a magenta line between points (494, 141) and (395, 135).
; PLAN: r0=494(x1), r1=141(y1), r2=395(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 141
LDI r2, 395
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
