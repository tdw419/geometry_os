; DESCRIPTION: Renders a white box of size 19x55 starting at (183, 33).
; PLAN: r0=183(x), r1=33(y), r2=19(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 33
LDI r2, 19
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
