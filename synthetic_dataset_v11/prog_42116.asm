; DESCRIPTION: Draws a blue line from (43, 141) to (166, 132).
; PLAN: r0=43(x1), r1=141(y1), r2=166(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 141
LDI r2, 166
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
