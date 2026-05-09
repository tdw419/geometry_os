; DESCRIPTION: Creates a cyan rectangular region at (96, 31) spanning 119 by 27 pixels.
; PLAN: r0=96(x), r1=31(y), r2=119(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 31
LDI r2, 119
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
