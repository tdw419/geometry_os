; DESCRIPTION: Renders a black box of size 90x69 starting at (42, 157).
; PLAN: r0=42(x), r1=157(y), r2=90(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 157
LDI r2, 90
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
