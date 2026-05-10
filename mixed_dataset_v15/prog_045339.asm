; DESCRIPTION: Draws a orange line from (198, 249) to (264, 133).
; PLAN: r0=198(x1), r1=249(y1), r2=264(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 249
LDI r2, 264
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
