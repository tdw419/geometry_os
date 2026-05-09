; DESCRIPTION: Creates a white circular shape at (295, 147) with radius 58.
; PLAN: r0=295(x), r1=147(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 147
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
