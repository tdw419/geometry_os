; DESCRIPTION: Draws a orange line from (485, 61) to (463, 42).
; PLAN: r0=485(x1), r1=61(y1), r2=463(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 61
LDI r2, 463
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
