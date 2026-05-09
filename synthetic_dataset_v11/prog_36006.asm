; DESCRIPTION: Renders a white box of size 13x119 starting at (113, 56).
; PLAN: r0=113(x), r1=56(y), r2=13(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 56
LDI r2, 13
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
