; DESCRIPTION: Renders a red box of size 18x116 starting at (12, 48).
; PLAN: r0=12(x), r1=48(y), r2=18(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 48
LDI r2, 18
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
