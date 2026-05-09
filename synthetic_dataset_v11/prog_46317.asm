; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (169, 130) with radius 79. Then Renders a magenta box of size 115x110 starting at (39, 60).
; PLAN: r0=169(x), r1=130(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=39(x), r1=60(y), r2=115(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (169, 130) with radius 79.
; PLAN: r0=169(x), r1=130(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 130
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta box of size 115x110 starting at (39, 60).
; PLAN: r0=39(x), r1=60(y), r2=115(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 60
LDI r2, 115
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
