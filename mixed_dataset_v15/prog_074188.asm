; DESCRIPTION: Creates a black rectangular region at (70, 53) spanning 84 by 93 pixels.
; PLAN: r0=70(x), r1=53(y), r2=84(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 53
LDI r2, 84
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
