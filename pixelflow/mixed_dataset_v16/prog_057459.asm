; DESCRIPTION: Renders a black box of size 19x13 starting at (368, 239).
; PLAN: r0=368(x), r1=239(y), r2=19(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 239
LDI r2, 19
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
