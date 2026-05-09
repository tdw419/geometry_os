; DESCRIPTION: Creates a cyan rectangular region at (134, 159) spanning 110 by 64 pixels.
; PLAN: r0=134(x), r1=159(y), r2=110(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 159
LDI r2, 110
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
