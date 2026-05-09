; DESCRIPTION: Composite: . Then Renders a magenta box of size 83x67 starting at (8, 74). Then Places a white circle of radius 28 at center (144, 149).
; PLAN: r0=8(x), r1=74(y), r2=83(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=144(x), r1=149(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta box of size 83x67 starting at (8, 74).
; PLAN: r0=8(x), r1=74(y), r2=83(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 74
LDI r2, 83
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 28 at center (144, 149).
; PLAN: r0=144(x), r1=149(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 149
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
