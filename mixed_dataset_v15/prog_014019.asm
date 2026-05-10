; DESCRIPTION: Renders a blue circular shape at (307, 130) with radius 42.
; PLAN: r0=307(x), r1=130(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 130
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
