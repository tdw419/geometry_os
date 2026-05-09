; DESCRIPTION: Places a orange line segment connecting (240, 135) to (225, 159).
; PLAN: r0=240(x1), r1=135(y1), r2=225(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 135
LDI r2, 225
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
