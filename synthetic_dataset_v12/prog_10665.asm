; DESCRIPTION: Places a orange line segment connecting (310, 60) to (217, 165).
; PLAN: r0=310(x1), r1=60(y1), r2=217(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 60
LDI r2, 217
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
