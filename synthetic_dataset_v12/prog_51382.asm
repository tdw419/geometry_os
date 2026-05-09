; DESCRIPTION: Draws a black line from (434, 252) to (92, 112).
; PLAN: r0=434(x1), r1=252(y1), r2=92(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 252
LDI r2, 92
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
