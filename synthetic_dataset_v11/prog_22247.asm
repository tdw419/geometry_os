; DESCRIPTION: Draws a blue line from (145, 84) to (228, 139).
; PLAN: r0=145(x1), r1=84(y1), r2=228(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 84
LDI r2, 228
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
