; DESCRIPTION: Renders a white line between points (14, 7) and (15, 220).
; PLAN: r0=14(x1), r1=7(y1), r2=15(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 7
LDI r2, 15
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
