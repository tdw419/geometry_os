; DESCRIPTION: Renders a orange box of size 93x116 starting at (96, 26).
; PLAN: r0=96(x), r1=26(y), r2=93(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 26
LDI r2, 93
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
