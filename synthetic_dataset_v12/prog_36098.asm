; DESCRIPTION: Creates a cyan rectangular region at (13, 104) spanning 33 by 85 pixels.
; PLAN: r0=13(x), r1=104(y), r2=33(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 104
LDI r2, 33
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
