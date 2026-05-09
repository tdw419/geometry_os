; DESCRIPTION: Composite: . Then Renders a magenta disk with center (98, 167) and radius 74. Then Places a orange 92x21 rectangle at position (41, 147).
; PLAN: r0=98(x), r1=167(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=41(x), r1=147(y), r2=92(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (98, 167) and radius 74.
; PLAN: r0=98(x), r1=167(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 167
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange 92x21 rectangle at position (41, 147).
; PLAN: r0=41(x), r1=147(y), r2=92(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 147
LDI r2, 92
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
