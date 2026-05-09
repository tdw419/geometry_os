; DESCRIPTION: Renders a orange line between points (296, 78) and (320, 250).
; PLAN: r0=296(x1), r1=78(y1), r2=320(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 78
LDI r2, 320
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
