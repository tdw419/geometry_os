; DESCRIPTION: Renders a white box of size 43x57 starting at (178, 136).
; PLAN: r0=178(x), r1=136(y), r2=43(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 136
LDI r2, 43
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
