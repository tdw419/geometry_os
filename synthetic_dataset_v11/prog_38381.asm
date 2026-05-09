; DESCRIPTION: Draws a blue line from (197, 50) to (200, 61).
; PLAN: r0=197(x1), r1=50(y1), r2=200(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 50
LDI r2, 200
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
