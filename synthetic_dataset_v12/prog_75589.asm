; DESCRIPTION: Creates a cyan rectangular region at (304, 55) spanning 43 by 102 pixels.
; PLAN: r0=304(x), r1=55(y), r2=43(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 55
LDI r2, 43
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
