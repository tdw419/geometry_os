; DESCRIPTION: Draws a red line from (493, 232) to (43, 42).
; PLAN: r0=493(x1), r1=232(y1), r2=43(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 232
LDI r2, 43
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
