; DESCRIPTION: Composite: . Then Renders a green box of size 20x76 starting at (126, 25). Then Renders a black disk with center (127, 138) and radius 40.
; PLAN: r0=126(x), r1=25(y), r2=20(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=127(x), r1=138(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a green box of size 20x76 starting at (126, 25).
; PLAN: r0=126(x), r1=25(y), r2=20(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 25
LDI r2, 20
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (127, 138) and radius 40.
; PLAN: r0=127(x), r1=138(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 138
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
