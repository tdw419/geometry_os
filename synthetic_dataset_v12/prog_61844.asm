; DESCRIPTION: Renders a white box of size 11x69 starting at (63, 157).
; PLAN: r0=63(x), r1=157(y), r2=11(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 157
LDI r2, 11
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
