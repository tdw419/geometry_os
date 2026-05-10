; DESCRIPTION: Renders a red box of size 116x57 starting at (143, 99).
; PLAN: r0=143(x), r1=99(y), r2=116(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 99
LDI r2, 116
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
