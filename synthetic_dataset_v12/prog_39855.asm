; DESCRIPTION: Renders a orange box of size 37x116 starting at (424, 77).
; PLAN: r0=424(x), r1=77(y), r2=37(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 77
LDI r2, 37
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
