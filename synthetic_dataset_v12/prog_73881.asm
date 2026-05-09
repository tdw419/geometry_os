; DESCRIPTION: Draws a blue line from (302, 254) to (82, 62).
; PLAN: r0=302(x1), r1=254(y1), r2=82(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 254
LDI r2, 82
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
