; DESCRIPTION: Renders a red box of size 28x21 starting at (233, 72).
; PLAN: r0=233(x), r1=72(y), r2=28(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 72
LDI r2, 28
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
