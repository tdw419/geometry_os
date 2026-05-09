; DESCRIPTION: Composite: . Then Renders a black line between points (33, 173) and (54, 205). Then Renders a red disk with center (133, 77) and radius 75.
; PLAN: r0=33(x1), r1=173(y1), r2=54(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=133(x), r1=77(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black line between points (33, 173) and (54, 205).
; PLAN: r0=33(x1), r1=173(y1), r2=54(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 173
LDI r2, 54
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (133, 77) and radius 75.
; PLAN: r0=133(x), r1=77(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 77
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
