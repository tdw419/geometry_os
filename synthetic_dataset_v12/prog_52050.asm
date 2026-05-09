; DESCRIPTION: Renders a red disk with center (224, 125) and radius 72.
; PLAN: r0=224(x), r1=125(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 125
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
