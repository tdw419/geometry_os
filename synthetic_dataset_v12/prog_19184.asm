; DESCRIPTION: Renders a green disk with center (379, 173) and radius 42.
; PLAN: r0=379(x), r1=173(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 173
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
