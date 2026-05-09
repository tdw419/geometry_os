; DESCRIPTION: Draws a black line from (368, 5) to (315, 144).
; PLAN: r0=368(x1), r1=5(y1), r2=315(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 5
LDI r2, 315
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
