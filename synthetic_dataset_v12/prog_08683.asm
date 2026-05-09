; DESCRIPTION: Places a red line segment connecting (326, 137) to (352, 114).
; PLAN: r0=326(x1), r1=137(y1), r2=352(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 137
LDI r2, 352
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
