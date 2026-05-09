; DESCRIPTION: Creates a cyan rectangular region at (164, 34) spanning 116 by 87 pixels.
; PLAN: r0=164(x), r1=34(y), r2=116(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 34
LDI r2, 116
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
