; DESCRIPTION: Draws a orange line from (42, 19) to (45, 132).
; PLAN: r0=42(x1), r1=19(y1), r2=45(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 19
LDI r2, 45
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
