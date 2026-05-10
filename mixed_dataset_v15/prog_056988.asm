; DESCRIPTION: Creates a cyan rectangular region at (348, 108) spanning 22 by 69 pixels.
; PLAN: r0=348(x), r1=108(y), r2=22(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 108
LDI r2, 22
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
