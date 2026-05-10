; DESCRIPTION: Creates a black rectangular region at (138, 149) spanning 98 by 23 pixels.
; PLAN: r0=138(x), r1=149(y), r2=98(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 149
LDI r2, 98
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
