; DESCRIPTION: Creates a red circular shape at (240, 98) with radius 37.
; PLAN: r0=240(x), r1=98(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 98
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
