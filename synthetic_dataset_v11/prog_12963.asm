; DESCRIPTION: Renders a red box of size 57x67 starting at (158, 53).
; PLAN: r0=158(x), r1=53(y), r2=57(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 53
LDI r2, 57
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
