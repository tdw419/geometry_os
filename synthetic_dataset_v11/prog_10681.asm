; DESCRIPTION: Renders a red box of size 74x86 starting at (103, 122).
; PLAN: r0=103(x), r1=122(y), r2=74(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 122
LDI r2, 74
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
