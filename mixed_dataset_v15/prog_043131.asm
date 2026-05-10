; DESCRIPTION: Creates a cyan rectangular region at (49, 9) spanning 114 by 76 pixels.
; PLAN: r0=49(x), r1=9(y), r2=114(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 9
LDI r2, 114
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
