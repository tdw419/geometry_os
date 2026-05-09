; DESCRIPTION: Renders a red box of size 46x74 starting at (59, 30).
; PLAN: r0=59(x), r1=30(y), r2=46(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 30
LDI r2, 46
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
