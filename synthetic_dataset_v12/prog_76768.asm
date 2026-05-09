; DESCRIPTION: Places a white line segment connecting (59, 135) to (122, 202).
; PLAN: r0=59(x1), r1=135(y1), r2=122(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 135
LDI r2, 122
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
