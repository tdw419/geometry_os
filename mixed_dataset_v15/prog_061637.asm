; DESCRIPTION: Creates a cyan rectangular region at (156, 219) spanning 71 by 31 pixels.
; PLAN: r0=156(x), r1=219(y), r2=71(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 219
LDI r2, 71
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
