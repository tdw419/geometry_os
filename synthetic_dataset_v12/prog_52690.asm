; DESCRIPTION: Renders a blue line between points (103, 148) and (123, 241).
; PLAN: r0=103(x1), r1=148(y1), r2=123(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 148
LDI r2, 123
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
