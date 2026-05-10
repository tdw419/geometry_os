; DESCRIPTION: Renders a red box of size 36x18 starting at (138, 222).
; PLAN: r0=138(x), r1=222(y), r2=36(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 222
LDI r2, 36
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
