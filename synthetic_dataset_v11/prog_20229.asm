; DESCRIPTION: Draws a black line from (223, 112) to (40, 253).
; PLAN: r0=223(x1), r1=112(y1), r2=40(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 112
LDI r2, 40
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
