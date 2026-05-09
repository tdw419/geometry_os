; DESCRIPTION: Creates a cyan rectangular region at (243, 139) spanning 116 by 83 pixels.
; PLAN: r0=243(x), r1=139(y), r2=116(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 139
LDI r2, 116
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
