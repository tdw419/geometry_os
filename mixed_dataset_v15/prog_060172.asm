; DESCRIPTION: Renders a magenta circular shape at (296, 6) with radius 31.
; PLAN: r0=296(x), r1=6(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 6
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
