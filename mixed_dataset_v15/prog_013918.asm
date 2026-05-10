; DESCRIPTION: Renders a red box of size 71x29 starting at (131, 117).
; PLAN: r0=131(x), r1=117(y), r2=71(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 117
LDI r2, 71
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
