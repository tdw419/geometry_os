; DESCRIPTION: Places a white line segment connecting (439, 194) to (210, 89).
; PLAN: r0=439(x1), r1=194(y1), r2=210(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 194
LDI r2, 210
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
