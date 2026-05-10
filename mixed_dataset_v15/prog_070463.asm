; DESCRIPTION: Renders a red box of size 34x106 starting at (385, 131).
; PLAN: r0=385(x), r1=131(y), r2=34(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 131
LDI r2, 34
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
