; DESCRIPTION: Draws a orange line from (42, 147) to (434, 113).
; PLAN: r0=42(x1), r1=147(y1), r2=434(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 147
LDI r2, 434
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
