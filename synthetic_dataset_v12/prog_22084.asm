; DESCRIPTION: Renders a red box of size 14x18 starting at (74, 26).
; PLAN: r0=74(x), r1=26(y), r2=14(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 26
LDI r2, 14
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
