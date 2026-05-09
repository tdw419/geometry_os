; DESCRIPTION: Creates a cyan rectangular region at (104, 84) spanning 32 by 34 pixels.
; PLAN: r0=104(x), r1=84(y), r2=32(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 84
LDI r2, 32
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
