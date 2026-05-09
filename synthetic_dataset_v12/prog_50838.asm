; DESCRIPTION: Draws a orange line from (244, 42) to (241, 18).
; PLAN: r0=244(x1), r1=42(y1), r2=241(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 42
LDI r2, 241
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
