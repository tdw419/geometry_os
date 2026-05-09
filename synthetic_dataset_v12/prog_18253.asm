; DESCRIPTION: Creates a cyan rectangular region at (90, 104) spanning 54 by 63 pixels.
; PLAN: r0=90(x), r1=104(y), r2=54(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 104
LDI r2, 54
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
