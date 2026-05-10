; DESCRIPTION: Renders a cyan circular shape at (273, 142) with radius 56.
; PLAN: r0=273(x), r1=142(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 142
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
