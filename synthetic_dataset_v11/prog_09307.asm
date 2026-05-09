; DESCRIPTION: Composite: . Then Renders a black box of size 34x108 starting at (81, 137). Then Draws a red circle centered at (213, 100) with radius 40.
; PLAN: r0=81(x), r1=137(y), r2=34(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=213(x), r1=100(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black box of size 34x108 starting at (81, 137).
; PLAN: r0=81(x), r1=137(y), r2=34(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 137
LDI r2, 34
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (213, 100) with radius 40.
; PLAN: r0=213(x), r1=100(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 100
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
