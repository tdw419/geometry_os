; DESCRIPTION: Draws a black line from (37, 80) to (198, 58).
; PLAN: r0=37(x1), r1=80(y1), r2=198(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 80
LDI r2, 198
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
