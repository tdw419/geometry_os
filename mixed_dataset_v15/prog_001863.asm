; DESCRIPTION: Places a white line segment connecting (329, 113) to (263, 102).
; PLAN: r0=329(x1), r1=113(y1), r2=263(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 113
LDI r2, 263
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
