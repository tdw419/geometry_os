; DESCRIPTION: Places a white line segment connecting (240, 228) to (88, 116).
; PLAN: r0=240(x1), r1=228(y1), r2=88(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 228
LDI r2, 88
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
