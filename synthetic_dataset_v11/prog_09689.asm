; DESCRIPTION: Composite: . Then Creates a purple circular shape at (115, 71) with radius 46. Then Places a red 77x17 rectangle at position (150, 86).
; PLAN: r0=115(x), r1=71(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=150(x), r1=86(y), r2=77(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (115, 71) with radius 46.
; PLAN: r0=115(x), r1=71(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 71
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red 77x17 rectangle at position (150, 86).
; PLAN: r0=150(x), r1=86(y), r2=77(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 86
LDI r2, 77
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
