; DESCRIPTION: Renders a magenta circular shape at (296, 68) with radius 42.
; PLAN: r0=296(x), r1=68(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 68
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
