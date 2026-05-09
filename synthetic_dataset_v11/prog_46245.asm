; DESCRIPTION: Renders a red box of size 58x37 starting at (148, 53).
; PLAN: r0=148(x), r1=53(y), r2=58(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 53
LDI r2, 58
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
