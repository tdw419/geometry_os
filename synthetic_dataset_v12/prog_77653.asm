; DESCRIPTION: Draws a orange line from (172, 249) to (285, 169).
; PLAN: r0=172(x1), r1=249(y1), r2=285(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 249
LDI r2, 285
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
