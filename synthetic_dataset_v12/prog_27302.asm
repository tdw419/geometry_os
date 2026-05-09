; DESCRIPTION: Places a red line segment connecting (418, 239) to (291, 179).
; PLAN: r0=418(x1), r1=239(y1), r2=291(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 239
LDI r2, 291
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
