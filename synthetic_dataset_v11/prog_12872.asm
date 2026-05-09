; DESCRIPTION: Renders a white box of size 71x81 starting at (14, 156).
; PLAN: r0=14(x), r1=156(y), r2=71(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 156
LDI r2, 71
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
