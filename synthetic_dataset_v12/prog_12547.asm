; DESCRIPTION: Renders a white box of size 43x112 starting at (266, 15).
; PLAN: r0=266(x), r1=15(y), r2=43(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 15
LDI r2, 43
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
