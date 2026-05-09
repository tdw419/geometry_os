; DESCRIPTION: Renders a white box of size 84x108 starting at (74, 1).
; PLAN: r0=74(x), r1=1(y), r2=84(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 1
LDI r2, 84
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
