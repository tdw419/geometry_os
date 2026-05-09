; DESCRIPTION: Draws a red line from (226, 192) to (235, 159).
; PLAN: r0=226(x1), r1=192(y1), r2=235(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 192
LDI r2, 235
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
