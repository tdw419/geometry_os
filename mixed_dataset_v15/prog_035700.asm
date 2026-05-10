; DESCRIPTION: Renders a blue line segment connecting (234, 32) to (206, 29).
; PLAN: r0=234(x1), r1=32(y1), r2=206(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 32
LDI r2, 206
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
