; DESCRIPTION: Renders a magenta disk with center (224, 82) and radius 60.
; PLAN: r0=224(x), r1=82(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 82
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
