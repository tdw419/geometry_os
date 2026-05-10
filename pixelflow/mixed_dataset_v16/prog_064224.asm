; DESCRIPTION: Renders a orange line between points (353, 112) and (228, 94).
; PLAN: r0=353(x1), r1=112(y1), r2=228(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 112
LDI r2, 228
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
