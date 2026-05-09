; DESCRIPTION: Composite: . Then Draws a green circle centered at (133, 106) with radius 58. Then Renders a black box of size 74x48 starting at (18, 23).
; PLAN: r0=133(x), r1=106(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=18(x), r1=23(y), r2=74(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (133, 106) with radius 58.
; PLAN: r0=133(x), r1=106(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 106
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black box of size 74x48 starting at (18, 23).
; PLAN: r0=18(x), r1=23(y), r2=74(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 23
LDI r2, 74
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
