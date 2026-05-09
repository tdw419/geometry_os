; DESCRIPTION: Draws a black line from (90, 12) to (181, 220).
; PLAN: r0=90(x1), r1=12(y1), r2=181(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 12
LDI r2, 181
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
