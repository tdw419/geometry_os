; DESCRIPTION: Draws a blue line from (116, 63) to (10, 168).
; PLAN: r0=116(x1), r1=63(y1), r2=10(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 63
LDI r2, 10
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
