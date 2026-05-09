; DESCRIPTION: Draws a black line from (325, 48) to (23, 206).
; PLAN: r0=325(x1), r1=48(y1), r2=23(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 48
LDI r2, 23
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
