; DESCRIPTION: Creates a cyan rectangular region at (70, 93) spanning 114 by 56 pixels.
; PLAN: r0=70(x), r1=93(y), r2=114(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 93
LDI r2, 114
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
