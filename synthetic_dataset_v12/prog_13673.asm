; DESCRIPTION: Renders a white box of size 36x29 starting at (67, 99).
; PLAN: r0=67(x), r1=99(y), r2=36(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 99
LDI r2, 36
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
