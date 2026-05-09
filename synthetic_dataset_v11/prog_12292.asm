; DESCRIPTION: Creates a cyan rectangular region at (57, 21) spanning 69 by 62 pixels.
; PLAN: r0=57(x), r1=21(y), r2=69(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 21
LDI r2, 69
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
