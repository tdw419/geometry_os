; DESCRIPTION: Creates a cyan rectangular region at (195, 19) spanning 62 by 77 pixels.
; PLAN: r0=195(x), r1=19(y), r2=62(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 19
LDI r2, 62
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
