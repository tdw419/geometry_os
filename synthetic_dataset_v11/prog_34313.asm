; DESCRIPTION: Creates a cyan rectangular region at (2, 62) spanning 11 by 43 pixels.
; PLAN: r0=2(x), r1=62(y), r2=11(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 62
LDI r2, 11
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
