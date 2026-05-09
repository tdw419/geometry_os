; DESCRIPTION: Draws a white line from (198, 108) to (132, 129).
; PLAN: r0=198(x1), r1=108(y1), r2=132(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 108
LDI r2, 132
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
