; DESCRIPTION: Renders a white box of size 69x92 starting at (105, 148).
; PLAN: r0=105(x), r1=148(y), r2=69(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 148
LDI r2, 69
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
