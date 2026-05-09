; DESCRIPTION: Creates a black rectangular region at (59, 115) spanning 22 by 98 pixels.
; PLAN: r0=59(x), r1=115(y), r2=22(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 115
LDI r2, 22
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
