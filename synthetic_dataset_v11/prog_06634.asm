; DESCRIPTION: Draws a blue line from (108, 197) to (40, 173).
; PLAN: r0=108(x1), r1=197(y1), r2=40(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 197
LDI r2, 40
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
