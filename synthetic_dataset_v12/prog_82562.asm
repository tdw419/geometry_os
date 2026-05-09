; DESCRIPTION: Places a white line segment connecting (61, 214) to (14, 239).
; PLAN: r0=61(x1), r1=214(y1), r2=14(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 214
LDI r2, 14
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
