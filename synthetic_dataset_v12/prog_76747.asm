; DESCRIPTION: Draws a blue line from (45, 63) to (206, 148).
; PLAN: r0=45(x1), r1=63(y1), r2=206(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 63
LDI r2, 206
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
