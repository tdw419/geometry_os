; DESCRIPTION: Draws a black line from (198, 65) to (199, 90).
; PLAN: r0=198(x1), r1=65(y1), r2=199(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 65
LDI r2, 199
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
