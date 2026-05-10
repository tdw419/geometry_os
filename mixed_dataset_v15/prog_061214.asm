; DESCRIPTION: Places a white line segment connecting (22, 172) to (434, 217).
; PLAN: r0=22(x1), r1=172(y1), r2=434(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 172
LDI r2, 434
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
