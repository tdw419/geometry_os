; DESCRIPTION: Renders a white box of size 57x105 starting at (299, 147).
; PLAN: r0=299(x), r1=147(y), r2=57(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 147
LDI r2, 57
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
