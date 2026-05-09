; DESCRIPTION: Renders a red box of size 82x72 starting at (101, 74).
; PLAN: r0=101(x), r1=74(y), r2=82(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 74
LDI r2, 82
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
