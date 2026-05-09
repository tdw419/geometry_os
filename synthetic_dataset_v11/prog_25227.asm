; DESCRIPTION: Creates a cyan rectangular region at (84, 53) spanning 68 by 12 pixels.
; PLAN: r0=84(x), r1=53(y), r2=68(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 53
LDI r2, 68
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
