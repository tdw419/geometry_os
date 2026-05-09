; DESCRIPTION: Creates a black rectangular region at (132, 28) spanning 47 by 35 pixels.
; PLAN: r0=132(x), r1=28(y), r2=47(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 28
LDI r2, 47
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
