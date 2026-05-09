; DESCRIPTION: Renders a red box of size 53x82 starting at (234, 105).
; PLAN: r0=234(x), r1=105(y), r2=53(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 105
LDI r2, 53
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
