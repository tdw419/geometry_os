; DESCRIPTION: Renders a white line between points (195, 134) and (120, 1).
; PLAN: r0=195(x1), r1=134(y1), r2=120(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 134
LDI r2, 120
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
