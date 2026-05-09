; DESCRIPTION: Places a white line segment connecting (291, 228) to (60, 99).
; PLAN: r0=291(x1), r1=228(y1), r2=60(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 228
LDI r2, 60
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
