; DESCRIPTION: Renders a white line between points (85, 149) and (95, 15).
; PLAN: r0=85(x1), r1=149(y1), r2=95(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 149
LDI r2, 95
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
