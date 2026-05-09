; DESCRIPTION: Renders a white line between points (17, 162) and (59, 49).
; PLAN: r0=17(x1), r1=162(y1), r2=59(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 162
LDI r2, 59
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
