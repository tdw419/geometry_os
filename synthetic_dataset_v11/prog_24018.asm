; DESCRIPTION: Renders a orange line between points (239, 114) and (94, 200).
; PLAN: r0=239(x1), r1=114(y1), r2=94(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 114
LDI r2, 94
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
