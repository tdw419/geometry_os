; DESCRIPTION: Places a white line segment connecting (138, 113) to (233, 86).
; PLAN: r0=138(x1), r1=113(y1), r2=233(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 113
LDI r2, 233
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
