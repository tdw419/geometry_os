; DESCRIPTION: Places a white line segment connecting (114, 171) to (15, 79).
; PLAN: r0=114(x1), r1=171(y1), r2=15(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 171
LDI r2, 15
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
