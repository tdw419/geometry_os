; DESCRIPTION: Renders a white box of size 120x15 starting at (53, 181).
; PLAN: r0=53(x), r1=181(y), r2=120(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 181
LDI r2, 120
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
