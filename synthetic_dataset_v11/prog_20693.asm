; DESCRIPTION: Renders a black box of size 14x60 starting at (12, 62).
; PLAN: r0=12(x), r1=62(y), r2=14(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 62
LDI r2, 14
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
