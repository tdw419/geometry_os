; DESCRIPTION: Renders a magenta line between points (175, 230) and (246, 84).
; PLAN: r0=175(x1), r1=230(y1), r2=246(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 230
LDI r2, 246
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
