; DESCRIPTION: Renders a red box of size 90x92 starting at (299, 67).
; PLAN: r0=299(x), r1=67(y), r2=90(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 67
LDI r2, 90
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
