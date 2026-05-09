; DESCRIPTION: Places a white line segment connecting (252, 176) to (113, 15).
; PLAN: r0=252(x1), r1=176(y1), r2=113(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 176
LDI r2, 113
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
