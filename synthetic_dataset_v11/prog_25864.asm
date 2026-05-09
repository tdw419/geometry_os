; DESCRIPTION: Draws a black line from (56, 92) to (30, 208).
; PLAN: r0=56(x1), r1=92(y1), r2=30(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 92
LDI r2, 30
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
