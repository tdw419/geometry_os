; DESCRIPTION: Renders a white box of size 62x27 starting at (109, 53).
; PLAN: r0=109(x), r1=53(y), r2=62(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 53
LDI r2, 62
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
