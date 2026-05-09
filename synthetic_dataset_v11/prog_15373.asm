; DESCRIPTION: Composite: . Then Creates a red circular shape at (192, 143) with radius 40. Then Renders a yellow line between points (65, 43) and (93, 11).
; PLAN: r0=192(x), r1=143(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=65(x1), r1=43(y1), r2=93(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red circular shape at (192, 143) with radius 40.
; PLAN: r0=192(x), r1=143(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 143
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow line between points (65, 43) and (93, 11).
; PLAN: r0=65(x1), r1=43(y1), r2=93(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 43
LDI r2, 93
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
