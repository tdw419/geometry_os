; DESCRIPTION: Places a white line segment connecting (253, 141) to (439, 29).
; PLAN: r0=253(x1), r1=141(y1), r2=439(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 141
LDI r2, 439
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
