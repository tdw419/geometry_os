; DESCRIPTION: Renders a red box of size 50x102 starting at (148, 26).
; PLAN: r0=148(x), r1=26(y), r2=50(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 26
LDI r2, 50
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
