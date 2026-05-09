; DESCRIPTION: Renders a blue line between points (50, 63) and (116, 157).
; PLAN: r0=50(x1), r1=63(y1), r2=116(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 63
LDI r2, 116
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
