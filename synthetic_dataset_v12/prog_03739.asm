; DESCRIPTION: Renders a blue box of size 107x31 starting at (309, 53).
; PLAN: r0=309(x), r1=53(y), r2=107(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 53
LDI r2, 107
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
