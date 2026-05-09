; DESCRIPTION: Creates a cyan rectangular region at (311, 108) spanning 82 by 18 pixels.
; PLAN: r0=311(x), r1=108(y), r2=82(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 108
LDI r2, 82
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
