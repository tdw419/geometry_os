; DESCRIPTION: Composite: . Then Creates a purple circular shape at (126, 196) with radius 38. Then Renders a green box of size 13x73 starting at (168, 181).
; PLAN: r0=126(x), r1=196(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=168(x), r1=181(y), r2=13(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (126, 196) with radius 38.
; PLAN: r0=126(x), r1=196(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 196
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a green box of size 13x73 starting at (168, 181).
; PLAN: r0=168(x), r1=181(y), r2=13(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 181
LDI r2, 13
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
