; DESCRIPTION: Draws a blue line from (40, 210) to (197, 137).
; PLAN: r0=40(x1), r1=210(y1), r2=197(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 210
LDI r2, 197
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
