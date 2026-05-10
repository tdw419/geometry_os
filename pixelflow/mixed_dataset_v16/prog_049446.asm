; DESCRIPTION: Draws a blue line from (450, 206) to (184, 36).
; PLAN: r0=450(x1), r1=206(y1), r2=184(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 206
LDI r2, 184
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
