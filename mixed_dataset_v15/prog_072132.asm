; DESCRIPTION: Draws a orange line from (256, 144) to (136, 127).
; PLAN: r0=256(x1), r1=144(y1), r2=136(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 144
LDI r2, 136
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
