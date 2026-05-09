; DESCRIPTION: Creates a black rectangular region at (16, 65) spanning 94 by 26 pixels.
; PLAN: r0=16(x), r1=65(y), r2=94(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 65
LDI r2, 94
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
