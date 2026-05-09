; DESCRIPTION: Places a black line segment connecting (35, 52) to (239, 190).
; PLAN: r0=35(x1), r1=52(y1), r2=239(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 52
LDI r2, 239
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
