; DESCRIPTION: Draws a orange line from (4, 240) to (64, 255).
; PLAN: r0=4(x1), r1=240(y1), r2=64(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 240
LDI r2, 64
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
