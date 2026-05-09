; DESCRIPTION: Draws a orange line from (291, 27) to (201, 171).
; PLAN: r0=291(x1), r1=27(y1), r2=201(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 27
LDI r2, 201
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
