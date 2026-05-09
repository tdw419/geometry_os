; DESCRIPTION: Renders a orange line between points (213, 40) and (195, 254).
; PLAN: r0=213(x1), r1=40(y1), r2=195(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 40
LDI r2, 195
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
