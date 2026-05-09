; DESCRIPTION: Draws a blue line from (336, 54) to (174, 6).
; PLAN: r0=336(x1), r1=54(y1), r2=174(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 54
LDI r2, 174
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
