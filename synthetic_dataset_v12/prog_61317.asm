; DESCRIPTION: Draws a orange line from (320, 239) to (194, 35).
; PLAN: r0=320(x1), r1=239(y1), r2=194(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 239
LDI r2, 194
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
