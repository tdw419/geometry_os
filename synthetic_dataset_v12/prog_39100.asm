; DESCRIPTION: Renders a red box of size 87x84 starting at (34, 134).
; PLAN: r0=34(x), r1=134(y), r2=87(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 134
LDI r2, 87
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
