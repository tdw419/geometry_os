; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (73, 101) with radius 60. Then Places a black 40x111 rectangle at position (214, 12).
; PLAN: r0=73(x), r1=101(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=214(x), r1=12(y), r2=40(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan circular shape at (73, 101) with radius 60.
; PLAN: r0=73(x), r1=101(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 101
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black 40x111 rectangle at position (214, 12).
; PLAN: r0=214(x), r1=12(y), r2=40(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 12
LDI r2, 40
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
