; DESCRIPTION: Renders a red box of size 53x98 starting at (424, 102).
; PLAN: r0=424(x), r1=102(y), r2=53(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 102
LDI r2, 53
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
