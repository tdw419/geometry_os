; DESCRIPTION: Creates a cyan rectangular region at (261, 54) spanning 13 by 32 pixels.
; PLAN: r0=261(x), r1=54(y), r2=13(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 54
LDI r2, 13
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
