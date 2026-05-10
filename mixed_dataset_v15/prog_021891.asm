; DESCRIPTION: Places a orange line segment connecting (346, 114) to (297, 228).
; PLAN: r0=346(x1), r1=114(y1), r2=297(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 114
LDI r2, 297
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
