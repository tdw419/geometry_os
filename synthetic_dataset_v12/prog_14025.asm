; DESCRIPTION: Renders a blue line between points (152, 106) and (229, 103).
; PLAN: r0=152(x1), r1=106(y1), r2=229(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 106
LDI r2, 229
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
