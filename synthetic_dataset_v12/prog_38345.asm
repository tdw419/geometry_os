; DESCRIPTION: Renders a orange line between points (10, 189) and (375, 213).
; PLAN: r0=10(x1), r1=189(y1), r2=375(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 189
LDI r2, 375
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
