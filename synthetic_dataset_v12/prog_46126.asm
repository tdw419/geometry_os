; DESCRIPTION: Creates a cyan rectangular region at (228, 99) spanning 96 by 102 pixels.
; PLAN: r0=228(x), r1=99(y), r2=96(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 99
LDI r2, 96
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
