; DESCRIPTION: Renders a red box of size 102x95 starting at (219, 140).
; PLAN: r0=219(x), r1=140(y), r2=102(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 140
LDI r2, 102
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
