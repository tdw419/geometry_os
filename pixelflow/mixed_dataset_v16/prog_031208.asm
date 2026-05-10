; DESCRIPTION: Draws a white line from (249, 198) to (248, 230).
; PLAN: r0=249(x1), r1=198(y1), r2=248(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 198
LDI r2, 248
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
