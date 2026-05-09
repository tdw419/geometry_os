; DESCRIPTION: Renders a black box of size 28x26 starting at (11, 178).
; PLAN: r0=11(x), r1=178(y), r2=28(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 178
LDI r2, 28
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
