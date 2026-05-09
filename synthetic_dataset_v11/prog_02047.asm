; DESCRIPTION: Renders a black box of size 113x119 starting at (85, 82).
; PLAN: r0=85(x), r1=82(y), r2=113(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 82
LDI r2, 113
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
