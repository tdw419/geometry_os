; DESCRIPTION: Composite: . Then Renders a purple box of size 47x63 starting at (8, 166). Then Renders a yellow disk with center (149, 86) and radius 78.
; PLAN: r0=8(x), r1=166(y), r2=47(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=149(x), r1=86(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple box of size 47x63 starting at (8, 166).
; PLAN: r0=8(x), r1=166(y), r2=47(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 166
LDI r2, 47
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (149, 86) and radius 78.
; PLAN: r0=149(x), r1=86(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 86
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
