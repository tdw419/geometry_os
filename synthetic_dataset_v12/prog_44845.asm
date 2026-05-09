; DESCRIPTION: Draws a blue line from (123, 71) to (172, 121).
; PLAN: r0=123(x1), r1=71(y1), r2=172(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 71
LDI r2, 172
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
