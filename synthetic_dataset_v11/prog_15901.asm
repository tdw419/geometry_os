; DESCRIPTION: Composite: . Then Creates a blue circular shape at (151, 90) with radius 74. Then Renders a red line between points (173, 35) and (105, 167).
; PLAN: r0=151(x), r1=90(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=173(x1), r1=35(y1), r2=105(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue circular shape at (151, 90) with radius 74.
; PLAN: r0=151(x), r1=90(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 90
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red line between points (173, 35) and (105, 167).
; PLAN: r0=173(x1), r1=35(y1), r2=105(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 35
LDI r2, 105
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
