; DESCRIPTION: Creates a cyan rectangular region at (280, 11) spanning 104 by 62 pixels.
; PLAN: r0=280(x), r1=11(y), r2=104(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 11
LDI r2, 104
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
