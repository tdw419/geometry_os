; DESCRIPTION: Renders a white rectangular region spanning 62 by 28 at (261, 73).
; PLAN: r0=261(x), r1=73(y), r2=62(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 73
LDI r2, 62
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
