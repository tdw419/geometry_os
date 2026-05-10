; DESCRIPTION: Renders a white box of size 116x60 starting at (377, 45).
; PLAN: r0=377(x), r1=45(y), r2=116(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 45
LDI r2, 116
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
