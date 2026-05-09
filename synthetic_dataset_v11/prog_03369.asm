; DESCRIPTION: Draws a purple line from (184, 253) to (211, 120).
; PLAN: r0=184(x1), r1=253(y1), r2=211(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 253
LDI r2, 211
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
