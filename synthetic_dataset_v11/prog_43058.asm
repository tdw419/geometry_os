; DESCRIPTION: Creates a cyan rectangular region at (156, 28) spanning 57 by 19 pixels.
; PLAN: r0=156(x), r1=28(y), r2=57(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 28
LDI r2, 57
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
