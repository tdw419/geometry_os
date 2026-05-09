; DESCRIPTION: Renders a black disk with center (214, 154) and radius 64.
; PLAN: r0=214(x), r1=154(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 154
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
