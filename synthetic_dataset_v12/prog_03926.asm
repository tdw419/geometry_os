; DESCRIPTION: Renders a white line between points (117, 85) and (10, 70).
; PLAN: r0=117(x1), r1=85(y1), r2=10(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 85
LDI r2, 10
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
