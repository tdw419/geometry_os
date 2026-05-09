; DESCRIPTION: Draws a purple line from (450, 136) to (204, 228).
; PLAN: r0=450(x1), r1=136(y1), r2=204(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 136
LDI r2, 204
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
