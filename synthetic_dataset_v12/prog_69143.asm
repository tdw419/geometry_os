; DESCRIPTION: Creates a cyan rectangular region at (42, 170) spanning 62 by 29 pixels.
; PLAN: r0=42(x), r1=170(y), r2=62(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 170
LDI r2, 62
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
