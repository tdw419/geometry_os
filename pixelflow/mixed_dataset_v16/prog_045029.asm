; DESCRIPTION: Draws a cyan circle centered at (133, 130) with radius 74.
; PLAN: r0=133(x), r1=130(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 130
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
