; DESCRIPTION: Composite: . Then Renders a black box of size 62x106 starting at (158, 60). Then Creates a cyan circular shape at (68, 118) with radius 43.
; PLAN: r0=158(x), r1=60(y), r2=62(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=68(x), r1=118(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black box of size 62x106 starting at (158, 60).
; PLAN: r0=158(x), r1=60(y), r2=62(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 60
LDI r2, 62
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (68, 118) with radius 43.
; PLAN: r0=68(x), r1=118(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 118
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
