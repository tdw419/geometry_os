; DESCRIPTION: Renders a black box of size 13x26 starting at (469, 82).
; PLAN: r0=469(x), r1=82(y), r2=13(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 82
LDI r2, 13
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
