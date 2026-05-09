; DESCRIPTION: Renders a green disk with center (200, 61) and radius 42.
; PLAN: r0=200(x), r1=61(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 61
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
