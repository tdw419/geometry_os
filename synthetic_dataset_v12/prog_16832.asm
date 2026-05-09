; DESCRIPTION: Places a orange line segment connecting (313, 202) to (310, 192).
; PLAN: r0=313(x1), r1=202(y1), r2=310(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 202
LDI r2, 310
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
