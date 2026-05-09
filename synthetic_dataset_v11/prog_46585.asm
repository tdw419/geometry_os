; DESCRIPTION: Composite: . Then Renders a purple disk with center (54, 20) and radius 20. Then Renders a red line between points (168, 65) and (143, 4).
; PLAN: r0=54(x), r1=20(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=168(x1), r1=65(y1), r2=143(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (54, 20) and radius 20.
; PLAN: r0=54(x), r1=20(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 20
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red line between points (168, 65) and (143, 4).
; PLAN: r0=168(x1), r1=65(y1), r2=143(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 65
LDI r2, 143
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
