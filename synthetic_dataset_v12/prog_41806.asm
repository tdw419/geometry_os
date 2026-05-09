; DESCRIPTION: Renders a green line between points (123, 69) and (105, 35).
; PLAN: r0=123(x1), r1=69(y1), r2=105(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 69
LDI r2, 105
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
