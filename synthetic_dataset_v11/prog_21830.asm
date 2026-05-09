; DESCRIPTION: Draws a red line from (42, 253) to (78, 172).
; PLAN: r0=42(x1), r1=253(y1), r2=78(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 253
LDI r2, 78
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
