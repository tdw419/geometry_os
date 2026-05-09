; DESCRIPTION: Renders a white line between points (435, 7) and (334, 4).
; PLAN: r0=435(x1), r1=7(y1), r2=334(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 7
LDI r2, 334
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
