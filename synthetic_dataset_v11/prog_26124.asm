; DESCRIPTION: Creates a cyan rectangular region at (162, 2) spanning 21 by 96 pixels.
; PLAN: r0=162(x), r1=2(y), r2=21(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 2
LDI r2, 21
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
