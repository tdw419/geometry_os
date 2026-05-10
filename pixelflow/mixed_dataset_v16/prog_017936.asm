; DESCRIPTION: Renders a black box of size 119x39 starting at (271, 49).
; PLAN: r0=271(x), r1=49(y), r2=119(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 49
LDI r2, 119
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
