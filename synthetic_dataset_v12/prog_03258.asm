; DESCRIPTION: Renders a white line between points (483, 195) and (375, 120).
; PLAN: r0=483(x1), r1=195(y1), r2=375(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 195
LDI r2, 375
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
