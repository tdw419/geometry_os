; DESCRIPTION: Renders a magenta circular shape at (287, 38) with radius 50.
; PLAN: r0=287(x), r1=38(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 38
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
