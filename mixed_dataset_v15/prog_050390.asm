; DESCRIPTION: Renders a white line segment connecting (94, 132) to (205, 123).
; PLAN: r0=94(x1), r1=132(y1), r2=205(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 132
LDI r2, 205
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
