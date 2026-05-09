; DESCRIPTION: Draws a orange line from (408, 133) to (384, 20).
; PLAN: r0=408(x1), r1=133(y1), r2=384(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 133
LDI r2, 384
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
