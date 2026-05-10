; DESCRIPTION: Renders a black box of size 23x14 starting at (486, 239).
; PLAN: r0=486(x), r1=239(y), r2=23(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 239
LDI r2, 23
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
