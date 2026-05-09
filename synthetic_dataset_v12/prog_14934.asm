; DESCRIPTION: Creates a cyan rectangular region at (49, 165) spanning 82 by 87 pixels.
; PLAN: r0=49(x), r1=165(y), r2=82(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 165
LDI r2, 82
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
