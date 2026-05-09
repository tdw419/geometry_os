; DESCRIPTION: Renders a white box of size 19x58 starting at (59, 194).
; PLAN: r0=59(x), r1=194(y), r2=19(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 194
LDI r2, 19
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
