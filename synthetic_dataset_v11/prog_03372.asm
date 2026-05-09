; DESCRIPTION: Places a white line segment connecting (46, 233) to (151, 176).
; PLAN: r0=46(x1), r1=233(y1), r2=151(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 233
LDI r2, 151
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
