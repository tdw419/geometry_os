; DESCRIPTION: Draws a red line from (336, 49) to (505, 13).
; PLAN: r0=336(x1), r1=49(y1), r2=505(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 49
LDI r2, 505
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
