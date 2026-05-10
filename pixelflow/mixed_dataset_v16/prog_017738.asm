; DESCRIPTION: Creates a cyan rectangular region at (354, 1) spanning 97 by 74 pixels.
; PLAN: r0=354(x), r1=1(y), r2=97(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 1
LDI r2, 97
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
