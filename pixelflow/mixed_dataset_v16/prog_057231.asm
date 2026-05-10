; DESCRIPTION: Renders a yellow line between points (461, 123) and (329, 192).
; PLAN: r0=461(x1), r1=123(y1), r2=329(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 123
LDI r2, 329
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
