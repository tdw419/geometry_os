; DESCRIPTION: Composite: . Then Renders a cyan box of size 95x88 starting at (84, 41). Then Creates a purple circular shape at (141, 154) with radius 37.
; PLAN: r0=84(x), r1=41(y), r2=95(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=141(x), r1=154(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan box of size 95x88 starting at (84, 41).
; PLAN: r0=84(x), r1=41(y), r2=95(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 41
LDI r2, 95
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (141, 154) with radius 37.
; PLAN: r0=141(x), r1=154(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 154
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
