; DESCRIPTION: Draws a orange line from (42, 203) to (186, 176).
; PLAN: r0=42(x1), r1=203(y1), r2=186(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 203
LDI r2, 186
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
