; DESCRIPTION: Places a white line segment connecting (239, 218) to (177, 33).
; PLAN: r0=239(x1), r1=218(y1), r2=177(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 218
LDI r2, 177
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
