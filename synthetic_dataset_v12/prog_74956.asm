; DESCRIPTION: Renders a white box of size 19x70 starting at (158, 32).
; PLAN: r0=158(x), r1=32(y), r2=19(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 32
LDI r2, 19
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
