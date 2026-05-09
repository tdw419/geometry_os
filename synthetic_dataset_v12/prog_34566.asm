; DESCRIPTION: Creates a cyan rectangular region at (459, 192) spanning 19 by 37 pixels.
; PLAN: r0=459(x), r1=192(y), r2=19(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 192
LDI r2, 19
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
