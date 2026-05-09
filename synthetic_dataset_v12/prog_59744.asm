; DESCRIPTION: Places a white line segment connecting (415, 17) to (269, 3).
; PLAN: r0=415(x1), r1=17(y1), r2=269(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 17
LDI r2, 269
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
