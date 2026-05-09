; DESCRIPTION: Composite: . Then Renders a yellow box of size 24x100 starting at (65, 89). Then Draws a blue circle centered at (166, 92) with radius 67.
; PLAN: r0=65(x), r1=89(y), r2=24(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=166(x), r1=92(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow box of size 24x100 starting at (65, 89).
; PLAN: r0=65(x), r1=89(y), r2=24(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 89
LDI r2, 24
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (166, 92) with radius 67.
; PLAN: r0=166(x), r1=92(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 92
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
