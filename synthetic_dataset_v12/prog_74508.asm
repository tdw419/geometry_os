; DESCRIPTION: Renders a red box of size 72x100 starting at (230, 92).
; PLAN: r0=230(x), r1=92(y), r2=72(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 92
LDI r2, 72
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
