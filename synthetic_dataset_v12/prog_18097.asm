; DESCRIPTION: Renders a red box of size 58x70 starting at (175, 53).
; PLAN: r0=175(x), r1=53(y), r2=58(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 53
LDI r2, 58
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
