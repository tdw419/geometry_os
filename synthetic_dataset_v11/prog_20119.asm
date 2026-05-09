; DESCRIPTION: Places a white line segment connecting (16, 58) to (183, 39).
; PLAN: r0=16(x1), r1=58(y1), r2=183(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 58
LDI r2, 183
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
