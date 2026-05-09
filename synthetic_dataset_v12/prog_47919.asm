; DESCRIPTION: Creates a cyan rectangular region at (83, 65) spanning 64 by 116 pixels.
; PLAN: r0=83(x), r1=65(y), r2=64(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 65
LDI r2, 64
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
