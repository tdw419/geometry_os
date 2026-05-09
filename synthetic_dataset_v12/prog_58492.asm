; DESCRIPTION: Draws a orange line from (178, 248) to (124, 254).
; PLAN: r0=178(x1), r1=248(y1), r2=124(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 248
LDI r2, 124
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
