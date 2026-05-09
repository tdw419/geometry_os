; DESCRIPTION: Creates a cyan rectangular region at (139, 55) spanning 108 by 116 pixels.
; PLAN: r0=139(x), r1=55(y), r2=108(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 55
LDI r2, 108
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
