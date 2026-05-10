; DESCRIPTION: Renders a red box of size 29x20 starting at (28, 48).
; PLAN: r0=28(x), r1=48(y), r2=29(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 48
LDI r2, 29
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
