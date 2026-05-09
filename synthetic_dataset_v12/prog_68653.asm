; DESCRIPTION: Creates a cyan rectangular region at (232, 3) spanning 82 by 119 pixels.
; PLAN: r0=232(x), r1=3(y), r2=82(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 3
LDI r2, 82
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
