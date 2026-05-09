; DESCRIPTION: Renders a yellow line between points (207, 143) and (265, 205).
; PLAN: r0=207(x1), r1=143(y1), r2=265(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 143
LDI r2, 265
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
