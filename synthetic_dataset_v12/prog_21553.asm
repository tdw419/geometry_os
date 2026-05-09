; DESCRIPTION: Renders a magenta line between points (416, 174) and (66, 25).
; PLAN: r0=416(x1), r1=174(y1), r2=66(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 174
LDI r2, 66
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
