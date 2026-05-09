; DESCRIPTION: Renders a red box of size 83x106 starting at (161, 30).
; PLAN: r0=161(x), r1=30(y), r2=83(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 30
LDI r2, 83
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
