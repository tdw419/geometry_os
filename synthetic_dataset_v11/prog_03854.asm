; DESCRIPTION: Places a white line segment connecting (183, 96) to (100, 166).
; PLAN: r0=183(x1), r1=96(y1), r2=100(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 96
LDI r2, 100
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
