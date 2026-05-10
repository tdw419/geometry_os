; DESCRIPTION: Renders a black box of size 14x19 starting at (482, 90).
; PLAN: r0=482(x), r1=90(y), r2=14(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 90
LDI r2, 14
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
