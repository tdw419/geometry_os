; DESCRIPTION: Renders a white line between points (349, 10) and (15, 26).
; PLAN: r0=349(x1), r1=10(y1), r2=15(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 10
LDI r2, 15
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
