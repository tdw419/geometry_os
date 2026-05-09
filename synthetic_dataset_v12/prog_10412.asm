; DESCRIPTION: Draws a black line from (55, 92) to (506, 213).
; PLAN: r0=55(x1), r1=92(y1), r2=506(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 92
LDI r2, 506
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
