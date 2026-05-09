; DESCRIPTION: Renders a red box of size 87x72 starting at (96, 10).
; PLAN: r0=96(x), r1=10(y), r2=87(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 10
LDI r2, 87
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
