; DESCRIPTION: Renders a black box of size 23x42 starting at (122, 45).
; PLAN: r0=122(x), r1=45(y), r2=23(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 45
LDI r2, 23
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
