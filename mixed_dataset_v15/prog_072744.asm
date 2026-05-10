; DESCRIPTION: Places a white line segment connecting (352, 105) to (270, 59).
; PLAN: r0=352(x1), r1=105(y1), r2=270(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 105
LDI r2, 270
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
