; DESCRIPTION: Renders a red box of size 116x76 starting at (376, 30).
; PLAN: r0=376(x), r1=30(y), r2=116(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 30
LDI r2, 116
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
