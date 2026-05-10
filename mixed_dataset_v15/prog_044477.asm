; DESCRIPTION: Places a magenta circle of radius 52 at center (224, 188).
; PLAN: r0=224(x), r1=188(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 188
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
