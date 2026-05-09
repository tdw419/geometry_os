; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (109, 140) with radius 73. Then Renders a red box of size 70x23 starting at (87, 193).
; PLAN: r0=109(x), r1=140(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=87(x), r1=193(y), r2=70(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (109, 140) with radius 73.
; PLAN: r0=109(x), r1=140(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 140
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red box of size 70x23 starting at (87, 193).
; PLAN: r0=87(x), r1=193(y), r2=70(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 193
LDI r2, 70
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
