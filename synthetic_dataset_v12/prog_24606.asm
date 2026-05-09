; DESCRIPTION: Creates a cyan rectangular region at (455, 70) spanning 57 by 114 pixels.
; PLAN: r0=455(x), r1=70(y), r2=57(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 70
LDI r2, 57
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
