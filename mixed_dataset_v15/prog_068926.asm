; DESCRIPTION: Places a white line segment connecting (134, 108) to (246, 228).
; PLAN: r0=134(x1), r1=108(y1), r2=246(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 108
LDI r2, 246
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
