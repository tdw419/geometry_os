; DESCRIPTION: Draws a orange line from (27, 4) to (193, 194).
; PLAN: r0=27(x1), r1=4(y1), r2=193(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 4
LDI r2, 193
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
