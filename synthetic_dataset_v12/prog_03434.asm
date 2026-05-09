; DESCRIPTION: Draws a red circle centered at (287, 130) with radius 42.
; PLAN: r0=287(x), r1=130(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 130
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
