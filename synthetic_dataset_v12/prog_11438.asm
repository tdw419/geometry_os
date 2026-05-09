; DESCRIPTION: Draws a orange line from (352, 235) to (253, 160).
; PLAN: r0=352(x1), r1=235(y1), r2=253(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 235
LDI r2, 253
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
