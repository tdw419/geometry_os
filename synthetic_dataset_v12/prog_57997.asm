; DESCRIPTION: Draws a black line from (377, 73) to (145, 174).
; PLAN: r0=377(x1), r1=73(y1), r2=145(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 73
LDI r2, 145
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
