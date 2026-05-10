; DESCRIPTION: Renders a magenta circular shape at (255, 185) with radius 24.
; PLAN: r0=255(x), r1=185(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 185
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
