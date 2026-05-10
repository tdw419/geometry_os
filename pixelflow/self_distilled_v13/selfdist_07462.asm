; DESCRIPTION: Renders a white circular shape at (231, 45) with radius 11.
; PLAN: r0=231(x), r1=45(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 45
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
