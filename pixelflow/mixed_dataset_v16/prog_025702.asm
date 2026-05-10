; DESCRIPTION: Renders a white box of size 52x113 starting at (69, 114).
; PLAN: r0=69(x), r1=114(y), r2=52(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 114
LDI r2, 52
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
