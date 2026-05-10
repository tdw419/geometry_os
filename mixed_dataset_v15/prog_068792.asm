; DESCRIPTION: Places a white line segment connecting (253, 254) to (299, 200).
; PLAN: r0=253(x1), r1=254(y1), r2=299(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 254
LDI r2, 299
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
