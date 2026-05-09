; DESCRIPTION: Draws a blue line from (247, 55) to (52, 43).
; PLAN: r0=247(x1), r1=55(y1), r2=52(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 55
LDI r2, 52
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
