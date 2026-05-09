; DESCRIPTION: Creates a cyan rectangular region at (34, 69) spanning 83 by 25 pixels.
; PLAN: r0=34(x), r1=69(y), r2=83(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 69
LDI r2, 83
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
