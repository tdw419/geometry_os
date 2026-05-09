; DESCRIPTION: Creates a cyan rectangular region at (239, 175) spanning 64 by 47 pixels.
; PLAN: r0=239(x), r1=175(y), r2=64(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 175
LDI r2, 64
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
