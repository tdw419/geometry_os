; DESCRIPTION: Places a orange line segment connecting (255, 196) to (160, 149).
; PLAN: r0=255(x1), r1=196(y1), r2=160(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 196
LDI r2, 160
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
