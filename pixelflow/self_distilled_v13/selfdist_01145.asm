; DESCRIPTION: Renders a yellow circular shape at (365, 42) with radius 28.
; PLAN: r0=365(x), r1=42(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 42
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
