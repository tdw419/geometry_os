; DESCRIPTION: Renders a white line between points (8, 54) and (492, 72).
; PLAN: r0=8(x1), r1=54(y1), r2=492(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 54
LDI r2, 492
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
