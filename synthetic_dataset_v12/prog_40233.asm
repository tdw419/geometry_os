; DESCRIPTION: Creates a cyan rectangular region at (13, 108) spanning 104 by 14 pixels.
; PLAN: r0=13(x), r1=108(y), r2=104(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 108
LDI r2, 104
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
