; DESCRIPTION: Renders a orange line between points (310, 207) and (276, 42).
; PLAN: r0=310(x1), r1=207(y1), r2=276(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 207
LDI r2, 276
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
