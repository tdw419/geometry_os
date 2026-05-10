; DESCRIPTION: Renders a black box of size 87x39 starting at (261, 158).
; PLAN: r0=261(x), r1=158(y), r2=87(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 158
LDI r2, 87
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
