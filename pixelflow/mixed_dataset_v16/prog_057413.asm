; DESCRIPTION: Draws a purple line from (92, 221) to (282, 150).
; PLAN: r0=92(x1), r1=221(y1), r2=282(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 221
LDI r2, 282
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
