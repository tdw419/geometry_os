; DESCRIPTION: Places a orange line segment connecting (144, 172) to (253, 249).
; PLAN: r0=144(x1), r1=172(y1), r2=253(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 172
LDI r2, 253
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
