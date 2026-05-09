; DESCRIPTION: Renders a red box of size 70x92 starting at (270, 0).
; PLAN: r0=270(x), r1=0(y), r2=70(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 0
LDI r2, 70
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
