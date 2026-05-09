; DESCRIPTION: Places a black circle of radius 28 at center (224, 128).
; PLAN: r0=224(x), r1=128(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 128
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
