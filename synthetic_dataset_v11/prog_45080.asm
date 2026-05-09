; DESCRIPTION: Composite: . Then Places a red 73x27 rectangle at position (129, 60). Then Creates a black circular shape at (174, 128) with radius 64.
; PLAN: r0=129(x), r1=60(y), r2=73(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=174(x), r1=128(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red 73x27 rectangle at position (129, 60).
; PLAN: r0=129(x), r1=60(y), r2=73(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 60
LDI r2, 73
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (174, 128) with radius 64.
; PLAN: r0=174(x), r1=128(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 128
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
