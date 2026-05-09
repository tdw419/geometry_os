; DESCRIPTION: Renders a white box of size 32x95 starting at (236, 88).
; PLAN: r0=236(x), r1=88(y), r2=32(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 88
LDI r2, 32
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
