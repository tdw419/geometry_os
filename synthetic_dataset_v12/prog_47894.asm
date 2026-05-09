; DESCRIPTION: Renders a white box of size 42x43 starting at (233, 53).
; PLAN: r0=233(x), r1=53(y), r2=42(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 53
LDI r2, 42
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
