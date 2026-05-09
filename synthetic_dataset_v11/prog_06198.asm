; DESCRIPTION: Composite: . Then Renders a cyan box of size 101x57 starting at (16, 170). Then Draws a purple circle centered at (41, 74) with radius 20.
; PLAN: r0=16(x), r1=170(y), r2=101(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=41(x), r1=74(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan box of size 101x57 starting at (16, 170).
; PLAN: r0=16(x), r1=170(y), r2=101(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 170
LDI r2, 101
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (41, 74) with radius 20.
; PLAN: r0=41(x), r1=74(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 74
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
