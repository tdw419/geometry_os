; DESCRIPTION: Draws a orange line from (56, 168) to (352, 90).
; PLAN: r0=56(x1), r1=168(y1), r2=352(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 168
LDI r2, 352
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
