; DESCRIPTION: Places a orange line segment connecting (240, 142) to (281, 81).
; PLAN: r0=240(x1), r1=142(y1), r2=281(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 142
LDI r2, 281
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
