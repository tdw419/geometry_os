; DESCRIPTION: Creates a black rectangular region at (330, 149) spanning 79 by 23 pixels.
; PLAN: r0=330(x), r1=149(y), r2=79(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 149
LDI r2, 79
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
