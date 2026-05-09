; DESCRIPTION: Renders a red box of size 14x40 starting at (102, 45).
; PLAN: r0=102(x), r1=45(y), r2=14(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 45
LDI r2, 14
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
