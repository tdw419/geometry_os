; DESCRIPTION: Renders a white box of size 53x119 starting at (60, 83).
; PLAN: r0=60(x), r1=83(y), r2=53(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 83
LDI r2, 53
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
