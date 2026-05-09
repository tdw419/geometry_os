; DESCRIPTION: Places a white line segment connecting (466, 116) to (329, 21).
; PLAN: r0=466(x1), r1=116(y1), r2=329(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 116
LDI r2, 329
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
