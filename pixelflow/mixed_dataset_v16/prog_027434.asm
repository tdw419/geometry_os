; DESCRIPTION: Places a white line segment connecting (21, 171) to (124, 59).
; PLAN: r0=21(x1), r1=171(y1), r2=124(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 171
LDI r2, 124
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
