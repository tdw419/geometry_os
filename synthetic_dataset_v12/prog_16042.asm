; DESCRIPTION: Creates a cyan rectangular region at (156, 12) spanning 114 by 86 pixels.
; PLAN: r0=156(x), r1=12(y), r2=114(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 12
LDI r2, 114
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
