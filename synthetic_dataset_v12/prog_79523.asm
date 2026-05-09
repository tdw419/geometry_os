; DESCRIPTION: Creates a cyan rectangular region at (23, 64) spanning 39 by 105 pixels.
; PLAN: r0=23(x), r1=64(y), r2=39(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 64
LDI r2, 39
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
