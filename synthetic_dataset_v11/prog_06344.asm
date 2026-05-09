; DESCRIPTION: Renders a blue line between points (188, 68) and (174, 9).
; PLAN: r0=188(x1), r1=68(y1), r2=174(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 68
LDI r2, 174
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
