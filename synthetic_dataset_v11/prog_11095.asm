; DESCRIPTION: Places a white line segment connecting (141, 96) to (164, 211).
; PLAN: r0=141(x1), r1=96(y1), r2=164(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 96
LDI r2, 164
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
