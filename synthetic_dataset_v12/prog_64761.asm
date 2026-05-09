; DESCRIPTION: Renders a magenta disk with center (386, 159) and radius 50.
; PLAN: r0=386(x), r1=159(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 159
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
