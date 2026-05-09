; DESCRIPTION: Renders a green disk with center (46, 76) and radius 42.
; PLAN: r0=46(x), r1=76(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 76
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
