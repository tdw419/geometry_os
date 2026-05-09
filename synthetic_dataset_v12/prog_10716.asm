; DESCRIPTION: Draws a orange line from (147, 3) to (42, 38).
; PLAN: r0=147(x1), r1=3(y1), r2=42(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 3
LDI r2, 42
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
