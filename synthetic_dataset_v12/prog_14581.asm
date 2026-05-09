; DESCRIPTION: Renders a white box of size 49x28 starting at (160, 26).
; PLAN: r0=160(x), r1=26(y), r2=49(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 26
LDI r2, 49
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
