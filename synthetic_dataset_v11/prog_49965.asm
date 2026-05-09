; DESCRIPTION: Draws a blue line from (122, 116) to (65, 123).
; PLAN: r0=122(x1), r1=116(y1), r2=65(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 116
LDI r2, 65
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
