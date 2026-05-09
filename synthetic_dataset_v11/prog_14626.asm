; DESCRIPTION: Renders a orange line between points (16, 84) and (17, 236).
; PLAN: r0=16(x1), r1=84(y1), r2=17(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 84
LDI r2, 17
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
