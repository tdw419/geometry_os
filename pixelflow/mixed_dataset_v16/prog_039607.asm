; DESCRIPTION: Creates a black circular shape at (446, 42) with radius 29.
; PLAN: r0=446(x), r1=42(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 42
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
