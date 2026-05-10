; DESCRIPTION: Renders a white box of size 100x24 starting at (194, 16).
; PLAN: r0=194(x), r1=16(y), r2=100(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 16
LDI r2, 100
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
