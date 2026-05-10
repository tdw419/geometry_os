; DESCRIPTION: Draws a black rectangle at (452, 45) with width 32 and height 53.
; PLAN: r0=452(x), r1=45(y), r2=32(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 45
LDI r2, 32
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
