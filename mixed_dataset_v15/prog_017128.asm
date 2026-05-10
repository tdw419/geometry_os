; DESCRIPTION: Renders a red box of size 32x36 starting at (157, 116).
; PLAN: r0=157(x), r1=116(y), r2=32(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 116
LDI r2, 32
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
