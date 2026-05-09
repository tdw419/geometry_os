; DESCRIPTION: Places a white line segment connecting (54, 103) to (454, 241).
; PLAN: r0=54(x1), r1=103(y1), r2=454(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 103
LDI r2, 454
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
