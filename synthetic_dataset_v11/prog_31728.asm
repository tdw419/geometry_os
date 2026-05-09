; DESCRIPTION: Renders a white line between points (9, 183) and (120, 13).
; PLAN: r0=9(x1), r1=183(y1), r2=120(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 183
LDI r2, 120
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
