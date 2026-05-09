; DESCRIPTION: Renders a white box of size 42x114 starting at (181, 141).
; PLAN: r0=181(x), r1=141(y), r2=42(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 141
LDI r2, 42
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
