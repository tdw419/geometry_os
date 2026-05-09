; DESCRIPTION: Draws a black line from (81, 171) to (137, 150).
; PLAN: r0=81(x1), r1=171(y1), r2=137(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 171
LDI r2, 137
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
