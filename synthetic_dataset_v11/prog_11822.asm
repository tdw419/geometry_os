; DESCRIPTION: Draws a black line from (244, 52) to (103, 35).
; PLAN: r0=244(x1), r1=52(y1), r2=103(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 52
LDI r2, 103
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
