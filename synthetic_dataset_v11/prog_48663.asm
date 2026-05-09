; DESCRIPTION: Renders a red box of size 117x92 starting at (98, 53).
; PLAN: r0=98(x), r1=53(y), r2=117(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 53
LDI r2, 117
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
