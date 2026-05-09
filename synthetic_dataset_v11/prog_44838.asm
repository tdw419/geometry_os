; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (210, 123) with radius 36. Then Places a red 81x23 rectangle at position (9, 6).
; PLAN: r0=210(x), r1=123(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=9(x), r1=6(y), r2=81(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (210, 123) with radius 36.
; PLAN: r0=210(x), r1=123(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 123
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red 81x23 rectangle at position (9, 6).
; PLAN: r0=9(x), r1=6(y), r2=81(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 6
LDI r2, 81
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
