; DESCRIPTION: Composite: . Then Renders a blue box of size 120x28 starting at (125, 139). Then Renders a yellow disk with center (212, 100) and radius 23.
; PLAN: r0=125(x), r1=139(y), r2=120(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=212(x), r1=100(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue box of size 120x28 starting at (125, 139).
; PLAN: r0=125(x), r1=139(y), r2=120(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 139
LDI r2, 120
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (212, 100) and radius 23.
; PLAN: r0=212(x), r1=100(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 100
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
