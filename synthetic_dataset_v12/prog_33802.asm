; DESCRIPTION: Renders a red box of size 65x29 starting at (90, 78).
; PLAN: r0=90(x), r1=78(y), r2=65(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 78
LDI r2, 65
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
