; DESCRIPTION: Composite: . Then Renders a blue box of size 49x56 starting at (26, 84). Then Renders a green disk with center (127, 50) and radius 24.
; PLAN: r0=26(x), r1=84(y), r2=49(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=127(x), r1=50(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue box of size 49x56 starting at (26, 84).
; PLAN: r0=26(x), r1=84(y), r2=49(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 84
LDI r2, 49
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green disk with center (127, 50) and radius 24.
; PLAN: r0=127(x), r1=50(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 50
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
