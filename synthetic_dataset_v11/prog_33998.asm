; DESCRIPTION: Composite: . Then Renders a yellow line between points (128, 119) and (178, 81). Then Creates a black circular shape at (108, 103) with radius 62.
; PLAN: r0=128(x1), r1=119(y1), r2=178(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=108(x), r1=103(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow line between points (128, 119) and (178, 81).
; PLAN: r0=128(x1), r1=119(y1), r2=178(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 119
LDI r2, 178
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (108, 103) with radius 62.
; PLAN: r0=108(x), r1=103(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 103
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
