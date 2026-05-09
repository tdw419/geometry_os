; DESCRIPTION: Composite: . Then Renders a black line between points (90, 85) and (221, 191). Then Renders a red disk with center (176, 188) and radius 68.
; PLAN: r0=90(x1), r1=85(y1), r2=221(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=176(x), r1=188(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black line between points (90, 85) and (221, 191).
; PLAN: r0=90(x1), r1=85(y1), r2=221(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 85
LDI r2, 221
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (176, 188) and radius 68.
; PLAN: r0=176(x), r1=188(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 188
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
