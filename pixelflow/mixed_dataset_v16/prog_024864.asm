; DESCRIPTION: Draws a black line from (48, 106) to (246, 233).
; PLAN: r0=48(x1), r1=106(y1), r2=246(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 106
LDI r2, 246
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
