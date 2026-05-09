; DESCRIPTION: Creates a cyan rectangular region at (175, 65) spanning 57 by 32 pixels.
; PLAN: r0=175(x), r1=65(y), r2=57(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 65
LDI r2, 57
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
