; DESCRIPTION: Renders a orange box of size 25x116 starting at (71, 119).
; PLAN: r0=71(x), r1=119(y), r2=25(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 119
LDI r2, 25
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
