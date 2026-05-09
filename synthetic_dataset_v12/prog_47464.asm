; DESCRIPTION: Draws a black line from (248, 109) to (464, 105).
; PLAN: r0=248(x1), r1=109(y1), r2=464(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 109
LDI r2, 464
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
