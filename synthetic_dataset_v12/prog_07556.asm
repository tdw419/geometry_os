; DESCRIPTION: Renders a red box of size 72x78 starting at (353, 25).
; PLAN: r0=353(x), r1=25(y), r2=72(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 25
LDI r2, 72
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
