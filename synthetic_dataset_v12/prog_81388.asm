; DESCRIPTION: Creates a cyan rectangular region at (355, 11) spanning 87 by 102 pixels.
; PLAN: r0=355(x), r1=11(y), r2=87(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 11
LDI r2, 87
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
