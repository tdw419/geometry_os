; DESCRIPTION: Draws a orange line from (352, 62) to (142, 207).
; PLAN: r0=352(x1), r1=62(y1), r2=142(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 62
LDI r2, 142
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
