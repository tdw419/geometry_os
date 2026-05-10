; DESCRIPTION: Creates a white circular shape at (392, 71) with radius 37.
; PLAN: r0=392(x), r1=71(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 71
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
