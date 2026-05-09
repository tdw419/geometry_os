; DESCRIPTION: Creates a black rectangular region at (59, 88) spanning 61 by 70 pixels.
; PLAN: r0=59(x), r1=88(y), r2=61(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 88
LDI r2, 61
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
