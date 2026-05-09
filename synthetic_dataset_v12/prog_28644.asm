; DESCRIPTION: Creates a cyan rectangular region at (163, 31) spanning 69 by 16 pixels.
; PLAN: r0=163(x), r1=31(y), r2=69(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 31
LDI r2, 69
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
