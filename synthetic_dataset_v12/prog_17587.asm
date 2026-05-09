; DESCRIPTION: Draws a black line from (336, 188) to (382, 0).
; PLAN: r0=336(x1), r1=188(y1), r2=382(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 188
LDI r2, 382
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
