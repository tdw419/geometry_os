; DESCRIPTION: Draws a blue line from (16, 50) to (106, 197).
; PLAN: r0=16(x1), r1=50(y1), r2=106(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 50
LDI r2, 106
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
