; DESCRIPTION: Renders a red box of size 31x95 starting at (148, 101).
; PLAN: r0=148(x), r1=101(y), r2=31(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 101
LDI r2, 31
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
