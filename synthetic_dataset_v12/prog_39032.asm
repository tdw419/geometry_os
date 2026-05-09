; DESCRIPTION: Draws a orange line from (239, 244) to (447, 211).
; PLAN: r0=239(x1), r1=244(y1), r2=447(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 244
LDI r2, 447
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
