; DESCRIPTION: Renders a green box of size 116x105 starting at (1, 69).
; PLAN: r0=1(x), r1=69(y), r2=116(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 69
LDI r2, 116
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
