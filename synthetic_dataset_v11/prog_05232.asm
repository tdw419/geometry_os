; DESCRIPTION: Renders a red box of size 18x28 starting at (24, 84).
; PLAN: r0=24(x), r1=84(y), r2=18(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 84
LDI r2, 18
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
