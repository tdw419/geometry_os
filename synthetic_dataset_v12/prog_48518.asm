; DESCRIPTION: Creates a cyan rectangular region at (131, 122) spanning 78 by 102 pixels.
; PLAN: r0=131(x), r1=122(y), r2=78(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 122
LDI r2, 78
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
