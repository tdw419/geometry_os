; DESCRIPTION: Creates a black rectangular region at (55, 127) spanning 93 by 84 pixels.
; PLAN: r0=55(x), r1=127(y), r2=93(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 127
LDI r2, 93
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
