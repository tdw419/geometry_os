; DESCRIPTION: Renders a red box of size 118x15 starting at (377, 103).
; PLAN: r0=377(x), r1=103(y), r2=118(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 103
LDI r2, 118
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
