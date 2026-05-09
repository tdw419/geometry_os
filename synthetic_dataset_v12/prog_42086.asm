; DESCRIPTION: Draws a orange line from (278, 242) to (232, 173).
; PLAN: r0=278(x1), r1=242(y1), r2=232(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 242
LDI r2, 232
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
