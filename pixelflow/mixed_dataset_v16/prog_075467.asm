; DESCRIPTION: Places a white line segment connecting (310, 237) to (9, 172).
; PLAN: r0=310(x1), r1=237(y1), r2=9(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 237
LDI r2, 9
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
