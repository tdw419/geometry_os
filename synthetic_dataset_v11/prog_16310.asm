; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (159, 122) with radius 22. Then Places a black 33x77 rectangle at position (129, 60).
; PLAN: r0=159(x), r1=122(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=129(x), r1=60(y), r2=33(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (159, 122) with radius 22.
; PLAN: r0=159(x), r1=122(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 122
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black 33x77 rectangle at position (129, 60).
; PLAN: r0=129(x), r1=60(y), r2=33(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 60
LDI r2, 33
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
