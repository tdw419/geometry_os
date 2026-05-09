; DESCRIPTION: Renders a red box of size 100x60 starting at (37, 10).
; PLAN: r0=37(x), r1=10(y), r2=100(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 10
LDI r2, 100
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
