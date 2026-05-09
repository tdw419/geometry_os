; DESCRIPTION: Creates a cyan rectangular region at (104, 128) spanning 110 by 101 pixels.
; PLAN: r0=104(x), r1=128(y), r2=110(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 128
LDI r2, 110
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
