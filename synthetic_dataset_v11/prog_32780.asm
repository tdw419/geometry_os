; DESCRIPTION: Renders a white box of size 19x69 starting at (143, 179).
; PLAN: r0=143(x), r1=179(y), r2=19(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 179
LDI r2, 19
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
