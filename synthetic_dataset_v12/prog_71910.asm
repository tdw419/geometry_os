; DESCRIPTION: Renders a white box of size 43x12 starting at (349, 58).
; PLAN: r0=349(x), r1=58(y), r2=43(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 58
LDI r2, 43
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
