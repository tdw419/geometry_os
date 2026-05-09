; DESCRIPTION: Draws a orange line from (214, 38) to (433, 143).
; PLAN: r0=214(x1), r1=38(y1), r2=433(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 38
LDI r2, 433
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
