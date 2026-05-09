; DESCRIPTION: Renders a white box of size 69x37 starting at (299, 203).
; PLAN: r0=299(x), r1=203(y), r2=69(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 203
LDI r2, 69
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
