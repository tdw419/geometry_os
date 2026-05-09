; DESCRIPTION: Renders a red box of size 79x102 starting at (336, 121).
; PLAN: r0=336(x), r1=121(y), r2=79(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 121
LDI r2, 79
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
