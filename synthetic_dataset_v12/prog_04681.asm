; DESCRIPTION: Renders a white box of size 69x72 starting at (249, 84).
; PLAN: r0=249(x), r1=84(y), r2=69(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 84
LDI r2, 69
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
