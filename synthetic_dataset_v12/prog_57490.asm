; DESCRIPTION: Renders a blue line between points (214, 207) and (85, 222).
; PLAN: r0=214(x1), r1=207(y1), r2=85(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 207
LDI r2, 85
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
