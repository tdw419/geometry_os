; DESCRIPTION: Renders a red box of size 48x24 starting at (315, 78).
; PLAN: r0=315(x), r1=78(y), r2=48(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 78
LDI r2, 48
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
