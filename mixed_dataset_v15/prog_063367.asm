; DESCRIPTION: Renders a white line between points (334, 54) and (352, 206).
; PLAN: r0=334(x1), r1=54(y1), r2=352(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 54
LDI r2, 352
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
