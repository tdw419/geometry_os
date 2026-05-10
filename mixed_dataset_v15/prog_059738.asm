; DESCRIPTION: Draws a black line from (105, 229) to (255, 232).
; PLAN: r0=105(x1), r1=229(y1), r2=255(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 229
LDI r2, 255
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
