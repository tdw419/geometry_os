; DESCRIPTION: Draws a black line from (443, 161) to (219, 159).
; PLAN: r0=443(x1), r1=161(y1), r2=219(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 161
LDI r2, 219
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
