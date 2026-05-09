; DESCRIPTION: Renders a green line between points (205, 151) and (36, 102).
; PLAN: r0=205(x1), r1=151(y1), r2=36(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 151
LDI r2, 36
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
