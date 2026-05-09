; DESCRIPTION: Places a white line segment connecting (399, 204) to (320, 95).
; PLAN: r0=399(x1), r1=204(y1), r2=320(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 204
LDI r2, 320
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
