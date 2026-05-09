; DESCRIPTION: Renders a blue line between points (68, 151) and (152, 206).
; PLAN: r0=68(x1), r1=151(y1), r2=152(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 151
LDI r2, 152
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
