; DESCRIPTION: Draws a orange line from (433, 19) to (271, 207).
; PLAN: r0=433(x1), r1=19(y1), r2=271(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 19
LDI r2, 271
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
