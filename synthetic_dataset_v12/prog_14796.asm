; DESCRIPTION: Renders a red box of size 53x19 starting at (319, 30).
; PLAN: r0=319(x), r1=30(y), r2=53(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 30
LDI r2, 53
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
