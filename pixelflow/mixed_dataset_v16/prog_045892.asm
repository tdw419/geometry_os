; DESCRIPTION: Places a white line segment connecting (284, 17) to (280, 218).
; PLAN: r0=284(x1), r1=17(y1), r2=280(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 17
LDI r2, 280
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
