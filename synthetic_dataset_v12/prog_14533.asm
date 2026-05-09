; DESCRIPTION: Draws a orange line from (57, 80) to (296, 64).
; PLAN: r0=57(x1), r1=80(y1), r2=296(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 80
LDI r2, 296
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
