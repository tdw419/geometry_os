; DESCRIPTION: Places a white line segment connecting (246, 232) to (38, 71).
; PLAN: r0=246(x1), r1=232(y1), r2=38(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 232
LDI r2, 38
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
