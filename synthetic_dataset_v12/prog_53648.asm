; DESCRIPTION: Creates a cyan rectangular region at (181, 175) spanning 55 by 69 pixels.
; PLAN: r0=181(x), r1=175(y), r2=55(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 175
LDI r2, 55
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
