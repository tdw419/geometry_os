; DESCRIPTION: Draws a black line from (145, 202) to (198, 54).
; PLAN: r0=145(x1), r1=202(y1), r2=198(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 202
LDI r2, 198
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
