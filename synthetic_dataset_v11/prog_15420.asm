; DESCRIPTION: Draws a orange line from (143, 42) to (31, 121).
; PLAN: r0=143(x1), r1=42(y1), r2=31(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 42
LDI r2, 31
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
