; DESCRIPTION: Creates a red rectangular region at (209, 1) spanning 105 by 116 pixels.
; PLAN: r0=209(x), r1=1(y), r2=105(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 1
LDI r2, 105
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
