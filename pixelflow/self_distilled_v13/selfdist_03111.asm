; DESCRIPTION: Renders a magenta circular shape at (91, 69) with radius 50.
; PLAN: r0=91(x), r1=69(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 69
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
