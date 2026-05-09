; DESCRIPTION: Creates a black rectangular region at (127, 2) spanning 39 by 83 pixels.
; PLAN: r0=127(x), r1=2(y), r2=39(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 2
LDI r2, 39
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
