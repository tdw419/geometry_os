; DESCRIPTION: Places a black line segment connecting (334, 121) to (352, 176).
; PLAN: r0=334(x1), r1=121(y1), r2=352(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 121
LDI r2, 352
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
