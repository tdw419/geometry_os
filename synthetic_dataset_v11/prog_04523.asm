; DESCRIPTION: Renders a white box of size 100x115 starting at (55, 3).
; PLAN: r0=55(x), r1=3(y), r2=100(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 3
LDI r2, 100
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
