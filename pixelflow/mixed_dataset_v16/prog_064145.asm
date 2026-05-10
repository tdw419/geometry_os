; DESCRIPTION: Draws a blue line from (120, 246) to (376, 208).
; PLAN: r0=120(x1), r1=246(y1), r2=376(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 246
LDI r2, 376
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
