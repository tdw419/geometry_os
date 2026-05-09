; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (192, 139) with radius 61. Then Draws a yellow line from (151, 95) to (115, 166).
; PLAN: r0=192(x), r1=139(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=151(x1), r1=95(y1), r2=115(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (192, 139) with radius 61.
; PLAN: r0=192(x), r1=139(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 139
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow line from (151, 95) to (115, 166).
; PLAN: r0=151(x1), r1=95(y1), r2=115(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 95
LDI r2, 115
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
