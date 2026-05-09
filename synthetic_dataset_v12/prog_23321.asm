; DESCRIPTION: Places a white line segment connecting (134, 228) to (463, 12).
; PLAN: r0=134(x1), r1=228(y1), r2=463(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 228
LDI r2, 463
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
