; DESCRIPTION: Draws a orange line from (42, 215) to (49, 147).
; PLAN: r0=42(x1), r1=215(y1), r2=49(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 215
LDI r2, 49
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
