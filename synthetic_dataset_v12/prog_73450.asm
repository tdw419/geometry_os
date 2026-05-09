; DESCRIPTION: Creates a cyan rectangular region at (239, 70) spanning 34 by 37 pixels.
; PLAN: r0=239(x), r1=70(y), r2=34(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 70
LDI r2, 34
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
