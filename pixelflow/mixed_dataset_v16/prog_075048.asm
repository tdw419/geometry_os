; DESCRIPTION: Renders a cyan disk with center (132, 224) and radius 23.
; PLAN: r0=132(x), r1=224(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 224
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
