; DESCRIPTION: Places a yellow line segment connecting (477, 176) to (352, 128).
; PLAN: r0=477(x1), r1=176(y1), r2=352(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 176
LDI r2, 352
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
