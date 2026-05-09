; DESCRIPTION: Composite: Places a white line segment connecting (80, 219) to (182, 64) then Sets a single black pixel at (4, 126).
; PLAN: r0=80(x1), r1=219(y1), r2=182(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=4(x), r6=126(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 80
LDI r1, 219
LDI r2, 182
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 4
LDI r6, 126
LDI r7, 0x000000
PSET r5, r6, r7
HALT
