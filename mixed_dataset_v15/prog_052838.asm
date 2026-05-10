; DESCRIPTION: Creates a yellow rectangular region at (310, 116) spanning 120 by 96 pixels.
; PLAN: r0=310(x), r1=116(y), r2=120(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 116
LDI r2, 120
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
