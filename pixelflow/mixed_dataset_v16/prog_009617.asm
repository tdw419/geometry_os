; DESCRIPTION: Creates a cyan rectangular region at (405, 46) spanning 105 by 97 pixels.
; PLAN: r0=405(x), r1=46(y), r2=105(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 46
LDI r2, 105
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
