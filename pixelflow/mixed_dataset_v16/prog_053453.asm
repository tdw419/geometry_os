; DESCRIPTION: Renders a white box of size 42x40 starting at (114, 182).
; PLAN: r0=114(x), r1=182(y), r2=42(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 182
LDI r2, 42
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
