; DESCRIPTION: Creates a black rectangular region at (117, 175) spanning 59 by 30 pixels.
; PLAN: r0=117(x), r1=175(y), r2=59(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 175
LDI r2, 59
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
