; DESCRIPTION: Renders a red box of size 116x13 starting at (150, 156).
; PLAN: r0=150(x), r1=156(y), r2=116(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 156
LDI r2, 116
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
