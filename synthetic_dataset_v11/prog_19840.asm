; DESCRIPTION: Creates a cyan rectangular region at (12, 44) spanning 34 by 62 pixels.
; PLAN: r0=12(x), r1=44(y), r2=34(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 44
LDI r2, 34
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
