; DESCRIPTION: Places a white line segment connecting (234, 59) to (310, 14).
; PLAN: r0=234(x1), r1=59(y1), r2=310(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 59
LDI r2, 310
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
