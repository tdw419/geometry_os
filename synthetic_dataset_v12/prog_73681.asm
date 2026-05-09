; DESCRIPTION: Creates a cyan rectangular region at (219, 8) spanning 97 by 19 pixels.
; PLAN: r0=219(x), r1=8(y), r2=97(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 8
LDI r2, 97
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
