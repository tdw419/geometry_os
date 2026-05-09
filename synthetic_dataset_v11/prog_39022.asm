; DESCRIPTION: Creates a cyan rectangular region at (45, 149) spanning 56 by 49 pixels.
; PLAN: r0=45(x), r1=149(y), r2=56(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 149
LDI r2, 56
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
