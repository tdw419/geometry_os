; DESCRIPTION: Creates a cyan rectangular region at (459, 106) spanning 16 by 115 pixels.
; PLAN: r0=459(x), r1=106(y), r2=16(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 106
LDI r2, 16
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
