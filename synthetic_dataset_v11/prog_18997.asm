; DESCRIPTION: Composite: . Then Renders a cyan box of size 69x73 starting at (42, 121). Then Creates a purple circular shape at (139, 78) with radius 24.
; PLAN: r0=42(x), r1=121(y), r2=69(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=139(x), r1=78(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan box of size 69x73 starting at (42, 121).
; PLAN: r0=42(x), r1=121(y), r2=69(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 121
LDI r2, 69
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (139, 78) with radius 24.
; PLAN: r0=139(x), r1=78(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 78
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
