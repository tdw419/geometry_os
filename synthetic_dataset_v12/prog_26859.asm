; DESCRIPTION: Creates a cyan rectangular region at (80, 88) spanning 110 by 32 pixels.
; PLAN: r0=80(x), r1=88(y), r2=110(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 88
LDI r2, 110
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
