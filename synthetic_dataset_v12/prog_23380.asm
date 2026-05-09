; DESCRIPTION: Renders a black box of size 19x13 starting at (353, 124).
; PLAN: r0=353(x), r1=124(y), r2=19(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 124
LDI r2, 19
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
