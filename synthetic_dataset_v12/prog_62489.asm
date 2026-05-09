; DESCRIPTION: Places a white line segment connecting (449, 112) to (415, 19).
; PLAN: r0=449(x1), r1=112(y1), r2=415(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 112
LDI r2, 415
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
