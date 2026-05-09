; DESCRIPTION: Draws a orange line from (170, 100) to (422, 42).
; PLAN: r0=170(x1), r1=100(y1), r2=422(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 100
LDI r2, 422
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
