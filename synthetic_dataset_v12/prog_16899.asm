; DESCRIPTION: Places a white line segment connecting (30, 114) to (467, 98).
; PLAN: r0=30(x1), r1=114(y1), r2=467(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 114
LDI r2, 467
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
