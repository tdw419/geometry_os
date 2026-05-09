; DESCRIPTION: Renders a orange line between points (371, 97) and (294, 137).
; PLAN: r0=371(x1), r1=97(y1), r2=294(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 97
LDI r2, 294
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
