; DESCRIPTION: Draws a blue line from (252, 164) to (20, 61).
; PLAN: r0=252(x1), r1=164(y1), r2=20(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 164
LDI r2, 20
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
