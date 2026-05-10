; DESCRIPTION: Renders a white box of size 43x19 starting at (336, 196).
; PLAN: r0=336(x), r1=196(y), r2=43(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 196
LDI r2, 43
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
