; DESCRIPTION: Draws a black line from (250, 202) to (36, 40).
; PLAN: r0=250(x1), r1=202(y1), r2=36(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 202
LDI r2, 36
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
