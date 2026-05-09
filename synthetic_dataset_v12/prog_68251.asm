; DESCRIPTION: Draws a black line from (420, 106) to (2, 246).
; PLAN: r0=420(x1), r1=106(y1), r2=2(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 106
LDI r2, 2
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
