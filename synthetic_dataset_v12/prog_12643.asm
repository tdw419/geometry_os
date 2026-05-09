; DESCRIPTION: Places a white line segment connecting (467, 166) to (252, 244).
; PLAN: r0=467(x1), r1=166(y1), r2=252(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 166
LDI r2, 252
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
