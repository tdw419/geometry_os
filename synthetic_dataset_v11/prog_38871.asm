; DESCRIPTION: Renders a orange line between points (198, 132) and (96, 206).
; PLAN: r0=198(x1), r1=132(y1), r2=96(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 132
LDI r2, 96
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
