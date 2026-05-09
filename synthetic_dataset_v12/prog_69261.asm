; DESCRIPTION: Draws a black line from (383, 106) to (158, 150).
; PLAN: r0=383(x1), r1=106(y1), r2=158(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 106
LDI r2, 158
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
