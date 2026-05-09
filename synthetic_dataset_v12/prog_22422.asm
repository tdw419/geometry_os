; DESCRIPTION: Renders a magenta disk with center (109, 152) and radius 72.
; PLAN: r0=109(x), r1=152(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 152
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
