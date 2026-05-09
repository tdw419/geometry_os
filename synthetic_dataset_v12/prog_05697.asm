; DESCRIPTION: Creates a cyan rectangular region at (53, 50) spanning 39 by 87 pixels.
; PLAN: r0=53(x), r1=50(y), r2=39(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 50
LDI r2, 39
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
