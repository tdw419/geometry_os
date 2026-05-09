; DESCRIPTION: Renders a red box of size 116x105 starting at (98, 133).
; PLAN: r0=98(x), r1=133(y), r2=116(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 133
LDI r2, 116
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
