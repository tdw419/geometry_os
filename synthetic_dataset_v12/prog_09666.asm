; DESCRIPTION: Renders a magenta line between points (490, 144) and (174, 29).
; PLAN: r0=490(x1), r1=144(y1), r2=174(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 144
LDI r2, 174
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
