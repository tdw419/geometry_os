; DESCRIPTION: Draws a blue line from (346, 85) to (148, 62).
; PLAN: r0=346(x1), r1=85(y1), r2=148(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 85
LDI r2, 148
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
