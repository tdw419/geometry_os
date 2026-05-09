; DESCRIPTION: Draws a blue line from (197, 238) to (58, 254).
; PLAN: r0=197(x1), r1=238(y1), r2=58(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 238
LDI r2, 58
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
