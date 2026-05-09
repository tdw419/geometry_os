; DESCRIPTION: Renders a red box of size 112x35 starting at (58, 167).
; PLAN: r0=58(x), r1=167(y), r2=112(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 167
LDI r2, 112
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
