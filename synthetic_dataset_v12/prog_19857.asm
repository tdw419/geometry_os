; DESCRIPTION: Draws a blue line from (365, 38) to (135, 8).
; PLAN: r0=365(x1), r1=38(y1), r2=135(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 38
LDI r2, 135
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
