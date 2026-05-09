; DESCRIPTION: Draws a orange line from (235, 73) to (182, 152).
; PLAN: r0=235(x1), r1=73(y1), r2=182(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 73
LDI r2, 182
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
