; DESCRIPTION: Draws a blue line from (100, 38) to (50, 173).
; PLAN: r0=100(x1), r1=38(y1), r2=50(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 38
LDI r2, 50
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
