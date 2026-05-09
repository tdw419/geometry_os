; DESCRIPTION: Draws a orange line from (400, 165) to (371, 82).
; PLAN: r0=400(x1), r1=165(y1), r2=371(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 165
LDI r2, 371
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
