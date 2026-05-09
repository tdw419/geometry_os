; DESCRIPTION: Creates a black rectangular region at (360, 28) spanning 56 by 25 pixels.
; PLAN: r0=360(x), r1=28(y), r2=56(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 28
LDI r2, 56
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
