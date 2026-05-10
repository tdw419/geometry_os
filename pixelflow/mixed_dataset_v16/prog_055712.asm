; DESCRIPTION: Places a white line segment connecting (291, 173) to (329, 77).
; PLAN: r0=291(x1), r1=173(y1), r2=329(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 173
LDI r2, 329
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
