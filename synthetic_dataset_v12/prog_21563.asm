; DESCRIPTION: Renders a white box of size 53x93 starting at (219, 85).
; PLAN: r0=219(x), r1=85(y), r2=53(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 85
LDI r2, 53
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
