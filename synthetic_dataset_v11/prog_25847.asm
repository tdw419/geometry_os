; DESCRIPTION: Creates a cyan rectangular region at (57, 98) spanning 62 by 70 pixels.
; PLAN: r0=57(x), r1=98(y), r2=62(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 98
LDI r2, 62
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
