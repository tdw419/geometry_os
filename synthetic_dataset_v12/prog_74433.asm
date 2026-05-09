; DESCRIPTION: Renders a red box of size 117x115 starting at (339, 102).
; PLAN: r0=339(x), r1=102(y), r2=117(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 102
LDI r2, 117
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
