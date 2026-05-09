; DESCRIPTION: Places a white line segment connecting (184, 0) to (338, 152).
; PLAN: r0=184(x1), r1=0(y1), r2=338(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 0
LDI r2, 338
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
