; DESCRIPTION: Renders a red box of size 100x61 starting at (30, 119).
; PLAN: r0=30(x), r1=119(y), r2=100(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 119
LDI r2, 100
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
