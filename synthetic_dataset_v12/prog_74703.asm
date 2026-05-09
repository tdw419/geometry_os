; DESCRIPTION: Places a white line segment connecting (434, 96) to (478, 165).
; PLAN: r0=434(x1), r1=96(y1), r2=478(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 96
LDI r2, 478
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
