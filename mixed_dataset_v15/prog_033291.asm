; DESCRIPTION: Creates a cyan rectangular region at (83, 159) spanning 115 by 82 pixels.
; PLAN: r0=83(x), r1=159(y), r2=115(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 159
LDI r2, 115
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
