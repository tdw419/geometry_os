; DESCRIPTION: Renders a yellow line between points (329, 189) and (299, 179).
; PLAN: r0=329(x1), r1=189(y1), r2=299(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 189
LDI r2, 299
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
