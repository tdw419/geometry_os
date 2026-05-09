; DESCRIPTION: Renders a magenta disk with center (173, 116) and radius 13.
; PLAN: r0=173(x), r1=116(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 116
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
