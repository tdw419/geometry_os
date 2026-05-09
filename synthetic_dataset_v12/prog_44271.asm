; DESCRIPTION: Creates a cyan rectangular region at (26, 80) spanning 70 by 102 pixels.
; PLAN: r0=26(x), r1=80(y), r2=70(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 80
LDI r2, 70
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
