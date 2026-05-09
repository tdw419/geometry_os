; DESCRIPTION: Places a orange line segment connecting (225, 141) to (320, 17).
; PLAN: r0=225(x1), r1=141(y1), r2=320(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 141
LDI r2, 320
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
