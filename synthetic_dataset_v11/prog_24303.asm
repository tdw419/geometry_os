; DESCRIPTION: Creates a cyan rectangular region at (13, 142) spanning 82 by 49 pixels.
; PLAN: r0=13(x), r1=142(y), r2=82(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 142
LDI r2, 82
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
