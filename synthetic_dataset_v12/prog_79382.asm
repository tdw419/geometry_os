; DESCRIPTION: Draws a blue line from (336, 147) to (228, 159).
; PLAN: r0=336(x1), r1=147(y1), r2=228(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 147
LDI r2, 228
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
