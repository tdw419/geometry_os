; DESCRIPTION: Draws a orange line from (44, 3) to (42, 121).
; PLAN: r0=44(x1), r1=3(y1), r2=42(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 3
LDI r2, 42
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
