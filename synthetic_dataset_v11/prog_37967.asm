; DESCRIPTION: Composite: . Then Renders a magenta box of size 99x38 starting at (148, 25). Then Renders a magenta disk with center (99, 105) and radius 69.
; PLAN: r0=148(x), r1=25(y), r2=99(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=99(x), r1=105(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta box of size 99x38 starting at (148, 25).
; PLAN: r0=148(x), r1=25(y), r2=99(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 25
LDI r2, 99
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta disk with center (99, 105) and radius 69.
; PLAN: r0=99(x), r1=105(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 105
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
