; DESCRIPTION: Draws a black line from (79, 181) to (443, 115).
; PLAN: r0=79(x1), r1=181(y1), r2=443(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 181
LDI r2, 443
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
