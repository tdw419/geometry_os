; DESCRIPTION: Draws a orange line from (256, 33) to (352, 142).
; PLAN: r0=256(x1), r1=33(y1), r2=352(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 33
LDI r2, 352
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
