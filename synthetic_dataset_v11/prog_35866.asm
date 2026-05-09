; DESCRIPTION: Renders a black box of size 53x107 starting at (187, 82).
; PLAN: r0=187(x), r1=82(y), r2=53(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 82
LDI r2, 53
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
