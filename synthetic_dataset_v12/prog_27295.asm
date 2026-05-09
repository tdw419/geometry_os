; DESCRIPTION: Creates a black rectangular region at (149, 37) spanning 99 by 91 pixels.
; PLAN: r0=149(x), r1=37(y), r2=99(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 37
LDI r2, 99
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
