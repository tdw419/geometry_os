; DESCRIPTION: Draws a black line from (6, 254) to (416, 159).
; PLAN: r0=6(x1), r1=254(y1), r2=416(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 254
LDI r2, 416
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
