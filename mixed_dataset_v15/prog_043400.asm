; DESCRIPTION: Draws a orange line from (352, 178) to (126, 181).
; PLAN: r0=352(x1), r1=178(y1), r2=126(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 178
LDI r2, 126
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
