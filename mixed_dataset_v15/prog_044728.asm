; DESCRIPTION: Creates a cyan rectangular region at (157, 32) spanning 25 by 79 pixels.
; PLAN: r0=157(x), r1=32(y), r2=25(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 32
LDI r2, 25
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
