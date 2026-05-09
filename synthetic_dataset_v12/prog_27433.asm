; DESCRIPTION: Renders a white box of size 25x88 starting at (3, 28).
; PLAN: r0=3(x), r1=28(y), r2=25(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 28
LDI r2, 25
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
