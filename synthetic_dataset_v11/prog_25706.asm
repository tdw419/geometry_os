; DESCRIPTION: Places a white line segment connecting (203, 228) to (130, 116).
; PLAN: r0=203(x1), r1=228(y1), r2=130(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 228
LDI r2, 130
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
