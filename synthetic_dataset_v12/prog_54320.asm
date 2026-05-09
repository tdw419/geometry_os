; DESCRIPTION: Renders a red box of size 12x108 starting at (432, 131).
; PLAN: r0=432(x), r1=131(y), r2=12(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 131
LDI r2, 12
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
