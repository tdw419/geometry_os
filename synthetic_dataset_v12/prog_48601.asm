; DESCRIPTION: Creates a cyan rectangular region at (304, 15) spanning 113 by 97 pixels.
; PLAN: r0=304(x), r1=15(y), r2=113(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 15
LDI r2, 113
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
