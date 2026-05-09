; DESCRIPTION: Draws a red line from (205, 235) to (195, 148).
; PLAN: r0=205(x1), r1=235(y1), r2=195(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 235
LDI r2, 195
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
