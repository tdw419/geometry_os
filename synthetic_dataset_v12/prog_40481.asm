; DESCRIPTION: Creates a cyan rectangular region at (62, 2) spanning 11 by 15 pixels.
; PLAN: r0=62(x), r1=2(y), r2=11(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 2
LDI r2, 11
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
