; DESCRIPTION: Renders a blue line between points (440, 154) and (472, 221).
; PLAN: r0=440(x1), r1=154(y1), r2=472(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 154
LDI r2, 472
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
