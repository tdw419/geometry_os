; DESCRIPTION: Renders a red box of size 108x36 starting at (117, 114).
; PLAN: r0=117(x), r1=114(y), r2=108(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 114
LDI r2, 108
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
