; DESCRIPTION: Draws a black line from (92, 232) to (388, 45).
; PLAN: r0=92(x1), r1=232(y1), r2=388(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 232
LDI r2, 388
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
