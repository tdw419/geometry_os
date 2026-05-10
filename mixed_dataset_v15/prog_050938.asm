; DESCRIPTION: Draws a orange line from (250, 167) to (392, 95).
; PLAN: r0=250(x1), r1=167(y1), r2=392(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 167
LDI r2, 392
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
