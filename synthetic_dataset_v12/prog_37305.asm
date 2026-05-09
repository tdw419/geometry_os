; DESCRIPTION: Renders a yellow line between points (254, 179) and (150, 156).
; PLAN: r0=254(x1), r1=179(y1), r2=150(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 179
LDI r2, 150
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
