; DESCRIPTION: Draws a black line from (325, 192) to (368, 132).
; PLAN: r0=325(x1), r1=192(y1), r2=368(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 192
LDI r2, 368
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
