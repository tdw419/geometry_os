; DESCRIPTION: Places a black line segment connecting (338, 126) to (17, 218).
; PLAN: r0=338(x1), r1=126(y1), r2=17(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 126
LDI r2, 17
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
