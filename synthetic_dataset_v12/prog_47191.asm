; DESCRIPTION: Renders a white box of size 104x62 starting at (134, 158).
; PLAN: r0=134(x), r1=158(y), r2=104(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 158
LDI r2, 104
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
