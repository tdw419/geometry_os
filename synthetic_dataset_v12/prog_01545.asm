; DESCRIPTION: Places a white line segment connecting (347, 76) to (328, 240).
; PLAN: r0=347(x1), r1=76(y1), r2=328(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 76
LDI r2, 328
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
