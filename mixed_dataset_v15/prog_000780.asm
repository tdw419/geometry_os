; DESCRIPTION: Renders a magenta line between points (353, 29) and (350, 95).
; PLAN: r0=353(x1), r1=29(y1), r2=350(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 29
LDI r2, 350
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
