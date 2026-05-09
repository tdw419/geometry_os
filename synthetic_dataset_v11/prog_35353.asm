; DESCRIPTION: Draws a blue line from (191, 79) to (102, 29).
; PLAN: r0=191(x1), r1=79(y1), r2=102(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 79
LDI r2, 102
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
