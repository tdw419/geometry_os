; DESCRIPTION: Renders a white box of size 75x34 starting at (129, 158).
; PLAN: r0=129(x), r1=158(y), r2=75(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 158
LDI r2, 75
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
