; DESCRIPTION: Places a black line segment connecting (189, 180) to (239, 116).
; PLAN: r0=189(x1), r1=180(y1), r2=239(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 180
LDI r2, 239
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
