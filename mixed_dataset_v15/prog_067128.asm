; DESCRIPTION: Draws a black line from (286, 64) to (206, 98).
; PLAN: r0=286(x1), r1=64(y1), r2=206(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 64
LDI r2, 206
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
