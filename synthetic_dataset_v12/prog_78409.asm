; DESCRIPTION: Places a white line segment connecting (16, 124) to (183, 223).
; PLAN: r0=16(x1), r1=124(y1), r2=183(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 124
LDI r2, 183
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
