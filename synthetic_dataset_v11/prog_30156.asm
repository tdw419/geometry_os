; DESCRIPTION: Renders a white box of size 116x107 starting at (0, 67).
; PLAN: r0=0(x), r1=67(y), r2=116(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 67
LDI r2, 116
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
