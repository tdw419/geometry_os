; DESCRIPTION: Draws a blue line from (16, 26) to (215, 181).
; PLAN: r0=16(x1), r1=26(y1), r2=215(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 26
LDI r2, 215
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
