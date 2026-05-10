; DESCRIPTION: Creates a cyan rectangular region at (381, 30) spanning 11 by 53 pixels.
; PLAN: r0=381(x), r1=30(y), r2=11(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 30
LDI r2, 11
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
