; DESCRIPTION: Renders a blue line between points (58, 165) and (75, 162).
; PLAN: r0=58(x1), r1=165(y1), r2=75(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 165
LDI r2, 75
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
