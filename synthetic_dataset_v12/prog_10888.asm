; DESCRIPTION: Places a white line segment connecting (323, 128) to (41, 221).
; PLAN: r0=323(x1), r1=128(y1), r2=41(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 128
LDI r2, 41
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
