; DESCRIPTION: Renders a white box of size 88x32 starting at (336, 144).
; PLAN: r0=336(x), r1=144(y), r2=88(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 144
LDI r2, 88
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
