; DESCRIPTION: Places a white line segment connecting (439, 106) to (143, 174).
; PLAN: r0=439(x1), r1=106(y1), r2=143(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 106
LDI r2, 143
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
