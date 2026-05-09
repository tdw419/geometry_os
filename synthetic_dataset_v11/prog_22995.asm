; DESCRIPTION: Draws a red line from (205, 42) to (25, 116).
; PLAN: r0=205(x1), r1=42(y1), r2=25(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 42
LDI r2, 25
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
