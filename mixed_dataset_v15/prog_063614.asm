; DESCRIPTION: Draws a blue line from (55, 194) to (354, 184).
; PLAN: r0=55(x1), r1=194(y1), r2=354(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 194
LDI r2, 354
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
