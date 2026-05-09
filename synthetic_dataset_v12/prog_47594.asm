; DESCRIPTION: Draws a black line from (16, 164) to (286, 181).
; PLAN: r0=16(x1), r1=164(y1), r2=286(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 164
LDI r2, 286
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
