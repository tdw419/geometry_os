; DESCRIPTION: Renders a black box of size 22x108 starting at (375, 128).
; PLAN: r0=375(x), r1=128(y), r2=22(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 128
LDI r2, 22
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
