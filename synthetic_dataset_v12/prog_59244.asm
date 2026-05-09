; DESCRIPTION: Places a white line segment connecting (90, 59) to (339, 152).
; PLAN: r0=90(x1), r1=59(y1), r2=339(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 59
LDI r2, 339
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
