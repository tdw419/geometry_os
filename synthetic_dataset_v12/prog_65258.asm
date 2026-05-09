; DESCRIPTION: Places a white line segment connecting (184, 50) to (88, 200).
; PLAN: r0=184(x1), r1=50(y1), r2=88(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 50
LDI r2, 88
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
