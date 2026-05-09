; DESCRIPTION: Draws a black line from (425, 92) to (223, 132).
; PLAN: r0=425(x1), r1=92(y1), r2=223(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 92
LDI r2, 223
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
