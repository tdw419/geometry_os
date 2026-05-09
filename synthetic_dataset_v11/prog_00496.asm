; DESCRIPTION: Renders a white box of size 22x15 starting at (67, 51).
; PLAN: r0=67(x), r1=51(y), r2=22(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 51
LDI r2, 22
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
