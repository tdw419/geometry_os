; DESCRIPTION: Places a white line segment connecting (182, 248) to (199, 132).
; PLAN: r0=182(x1), r1=248(y1), r2=199(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 248
LDI r2, 199
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
