; DESCRIPTION: Draws a black line from (134, 197) to (385, 159).
; PLAN: r0=134(x1), r1=197(y1), r2=385(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 197
LDI r2, 385
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
