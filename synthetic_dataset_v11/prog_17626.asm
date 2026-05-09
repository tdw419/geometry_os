; DESCRIPTION: Draws a orange line from (89, 42) to (24, 49).
; PLAN: r0=89(x1), r1=42(y1), r2=24(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 42
LDI r2, 24
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
