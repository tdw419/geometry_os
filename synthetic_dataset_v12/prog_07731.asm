; DESCRIPTION: Renders a black box of size 69x50 starting at (238, 69).
; PLAN: r0=238(x), r1=69(y), r2=69(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 69
LDI r2, 69
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
