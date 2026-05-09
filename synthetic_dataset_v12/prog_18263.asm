; DESCRIPTION: Renders a red box of size 59x55 starting at (71, 25).
; PLAN: r0=71(x), r1=25(y), r2=59(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 25
LDI r2, 59
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
