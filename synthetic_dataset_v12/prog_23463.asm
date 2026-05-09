; DESCRIPTION: Creates a cyan rectangular region at (157, 115) spanning 55 by 72 pixels.
; PLAN: r0=157(x), r1=115(y), r2=55(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 115
LDI r2, 55
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
