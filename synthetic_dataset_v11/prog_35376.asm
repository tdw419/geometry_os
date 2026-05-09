; DESCRIPTION: Places a white line segment connecting (5, 98) to (158, 152).
; PLAN: r0=5(x1), r1=98(y1), r2=158(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 98
LDI r2, 158
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
