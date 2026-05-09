; DESCRIPTION: Places a white line segment connecting (130, 172) to (420, 15).
; PLAN: r0=130(x1), r1=172(y1), r2=420(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 172
LDI r2, 420
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
