; DESCRIPTION: Renders a white rectangular region spanning 34 by 81 at (187, 88).
; PLAN: r0=187(x), r1=88(y), r2=34(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 88
LDI r2, 34
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
