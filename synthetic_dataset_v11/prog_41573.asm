; DESCRIPTION: Renders a yellow line between points (94, 30) and (239, 140).
; PLAN: r0=94(x1), r1=30(y1), r2=239(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 30
LDI r2, 239
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
