; DESCRIPTION: Creates a cyan rectangular region at (156, 49) spanning 37 by 107 pixels.
; PLAN: r0=156(x), r1=49(y), r2=37(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 49
LDI r2, 37
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
