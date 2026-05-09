; DESCRIPTION: Places a white line segment connecting (4, 214) to (356, 14).
; PLAN: r0=4(x1), r1=214(y1), r2=356(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 214
LDI r2, 356
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
