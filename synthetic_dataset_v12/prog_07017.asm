; DESCRIPTION: Renders a red box of size 36x86 starting at (247, 116).
; PLAN: r0=247(x), r1=116(y), r2=36(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 116
LDI r2, 36
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
