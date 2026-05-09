; DESCRIPTION: Places a orange line segment connecting (177, 171) to (225, 116).
; PLAN: r0=177(x1), r1=171(y1), r2=225(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 171
LDI r2, 225
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
