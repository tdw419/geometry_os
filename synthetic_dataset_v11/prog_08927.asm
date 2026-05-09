; DESCRIPTION: Creates a cyan rectangular region at (14, 69) spanning 43 by 24 pixels.
; PLAN: r0=14(x), r1=69(y), r2=43(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 69
LDI r2, 43
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
