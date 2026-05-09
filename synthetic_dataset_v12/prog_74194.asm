; DESCRIPTION: Draws a blue line from (101, 52) to (498, 197).
; PLAN: r0=101(x1), r1=52(y1), r2=498(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 52
LDI r2, 498
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
