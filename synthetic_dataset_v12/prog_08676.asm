; DESCRIPTION: Places a white line segment connecting (59, 17) to (208, 112).
; PLAN: r0=59(x1), r1=17(y1), r2=208(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 17
LDI r2, 208
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
