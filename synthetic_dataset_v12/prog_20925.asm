; DESCRIPTION: Draws a black line from (274, 247) to (336, 127).
; PLAN: r0=274(x1), r1=247(y1), r2=336(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 247
LDI r2, 336
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
