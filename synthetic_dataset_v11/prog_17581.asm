; DESCRIPTION: Places a white line segment connecting (194, 64) to (143, 174).
; PLAN: r0=194(x1), r1=64(y1), r2=143(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 64
LDI r2, 143
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
