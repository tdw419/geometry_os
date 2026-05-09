; DESCRIPTION: Renders a white line between points (40, 230) and (85, 13).
; PLAN: r0=40(x1), r1=230(y1), r2=85(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 230
LDI r2, 85
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
